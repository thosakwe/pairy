library pairy_server;

import 'dart:async';
import 'dart:convert';
import 'package:angel_auth/angel_auth.dart' hide UserSerializer;
import 'package:angel_cors/angel_cors.dart';
import 'package:angel_framework/angel_framework.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:file/local.dart';
import 'package:http_parser/http_parser.dart';
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:pairy/pairy.dart';
import 'src/config/config.dart' as configuration;
import 'src/routes/routes.dart' as routes;
import 'src/services/services.dart' as services;

/// Configures the server instance.
Future configureServer(Angel app) async {
  // Enable CORS
  app.use(cors());

  // Set up our application, using the plug-ins defined with this project.
  await app.configure(configuration.configureServer(const LocalFileSystem()));

  // JWT-based authentication :)
  var auth = new AngelAuth<User>(
    jwtKey: app.configuration['jwt_secret'],
    allowCookie: false,
  );

  var githubStrategy = new GithubAuthStrategy(app.configuration['github']);
  auth.strategies.add(githubStrategy);

  auth.serializer = (user) async => user.id;

  // Parse JWTs
  app.use(auth.decodeJwt);

  app.get('/auth/github', auth.authenticate('github'));
  app.get(
      '/auth/github/callback',
      auth.authenticate('github', new AngelAuthOptions(
        callback: (req, res, jwt) async {
          var uri = new Uri(
            scheme: 'pairy',
            host: 'auth.callback',
            path: 'token',
            queryParameters: {
              'jwt': jwt,
            },
          );

          return res.redirect(uri.toString());

          res.headers['content-type'] = 'text/html';
          res.write('''
<!DOCTYPE html>
<html>
  <head>
    <title>Authentication Success</title>
  </head>
  <body>
    <noscript>You must enable JavaScript for Pairy sign-in to work!</noscript>
    <script>
      if (window.confirm('Sign-in successful. Hit "YES" to go back to Pairy.')) {
        window.open('${uri.toString()}');
        window.close();
      }
    </script>
  </body>
</html>
''');
          res.end();
        },
      )));

  var db = new Db(app.configuration['mongo_db']);
  await db.open();

  await app.configure(services.configureServer(db));
  await app.configure(routes.configureServer(const LocalFileSystem()));
}

class GithubAuthStrategy extends AuthStrategy {
  final String name = 'github';

  GithubAuthStrategy(this.githubConfig);

  static const List<String> scopes = const [
    'public_repo',
    'read:user',
  ];

  static Map<String, String> parseUrlEncodedOrJson(
      MediaType contentType, String body) {
    if (contentType.subtype == 'x-www-form-urlencoded') {
      return Uri.splitQueryString(body);
    }

    return JSON.decode(body);
  }

  @override
  Future<bool> canLogout(RequestContext req, ResponseContext res) async => true;

  final Map githubConfig;

  oauth2.AuthorizationCodeGrant createGrant() {
    return new oauth2.AuthorizationCodeGrant(
      githubConfig['id'],
      Uri.parse('https://github.com/login/oauth/authorize'),
      Uri.parse('https://github.com/login/oauth/access_token'),
      secret: githubConfig['secret'],
      getParameters: parseUrlEncodedOrJson,
    );
  }

  @override
  Future authenticate(RequestContext req, ResponseContext res,
      [AngelAuthOptions options]) async {
    if (options != null) return await authenticateCallback(req, res, options);
    var redirectUri = createGrant().getAuthorizationUrl(
      Uri.parse(githubConfig['redirect_uri']),
      scopes: scopes,
      state: req.query['state'],
    );
    res.redirect(redirectUri.toString());
    return true;
  }

  Future authenticateCallback(
      RequestContext req, ResponseContext res, AngelAuthOptions options) async {
    var grant = createGrant();
    grant.getAuthorizationUrl(
      Uri.parse(githubConfig['redirect_uri']),
      scopes: scopes,
    );

    var client = await grant.handleAuthorizationResponse(req.query);
    var response = await client.get('https://api.github.com/user', headers: {
      'accept': 'application/json',
    });
    var githubUser = GithubUserSerializer.fromMap(JSON.decode(response.body));

    var userService = req.app.injections['userService'] as Service;
    Iterable<User> withUserId =
        await userService.index().then((it) => it.map(UserSerializer.fromMap));
    User user;

    if (withUserId.isNotEmpty) {
      user = withUserId.first;
    } else {
      user = new User(
        githubId: githubUser.id.toString(),
        name: githubUser.name,
        avatar: githubUser.avatarUrl,
      );
    }

    // TODO: Include all fields, or find some other creative way to fetch them on-the-fly.

    if (withUserId.isEmpty) {
      return await userService
          .create(user.toJson())
          .then((map) => UserSerializer.fromMap(map));
    } else {
      return await userService
          .modify(user.id, user.toJson())
          .then((map) => UserSerializer.fromMap(map));
    }
  }
}
