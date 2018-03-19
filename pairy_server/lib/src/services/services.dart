library pairy_server.services;

import 'package:angel_framework/angel_framework.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'user.dart' as user;

/// Configure our application to use *services*.
/// Services must be wired to the app via `app.use`.
///
/// They provide many benefits, such as instant REST API generation,
/// and respond to both REST and WebSockets.
///
/// Read more here:
/// https://github.com/angel-dart/angel/wiki/Service-Basics
AngelConfigurer configureServer(Db db) {
  return (Angel app) async {
    await app.configure(user.configureServer(db));
  };
}
