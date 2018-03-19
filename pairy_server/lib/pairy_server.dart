library pairy_server;

import 'dart:async';
import 'package:angel_auth/angel_auth.dart';
import 'package:angel_cors/angel_cors.dart';
import 'package:angel_framework/angel_framework.dart';
import 'package:file/local.dart';
import 'package:http_parser/http_parser.dart';
import 'package:oauth2/oauth2.dart' as oauth2;
import 'src/config/config.dart' as configuration;
import 'src/routes/routes.dart' as routes;
import 'src/services/services.dart' as services;

/// Configures the server instance.
Future configureServer(Angel app) async {
  // Enable CORS
  app.use(cors());

  // Set up our application, using the plug-ins defined with this project.
  await app.configure(configuration.configureServer(const LocalFileSystem()));


  await app.configure(services.configureServer);
  await app.configure(routes.configureServer(const LocalFileSystem()));
}
