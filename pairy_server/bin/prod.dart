import 'dart:io';
import 'dart:isolate';
import 'package:pairy_server/pairy_server.dart';
import 'package:angel_framework/angel_framework.dart';
import 'package:logging/logging.dart';

const String hostname = '127.0.0.1';
const int port = 3000;

void main() {
  // Start a server instance in multiple isolates.

  for (int id = 0; id < Platform.numberOfProcessors; id++)
    Isolate.spawn(isolateMain, id);

  isolateMain(Platform.numberOfProcessors);
}

void isolateMain(int id) {
  // Passing `startShared` to the constructor allows us to start multiple
  // instances of our application concurrently, listening on a single port.
  //
  // This effectively lets us multi-thread the application.
  var app = new Angel.custom(startShared);

  app.configure(configureServer).then((_) async {
    // In production, we'll want to log errors to a file.
    // Alternatives include sending logs to a service like Sentry.
    app.logger = new Logger('angel')
      ..onRecord.listen((rec) {
        if (rec.error != null) {
          var sink =
              new File('server_log.txt').openWrite(mode: FileMode.APPEND);
          sink
            ..writeln(rec.error)
            ..writeln(rec.stackTrace)
            ..close();
        }
      });

    var server = await app.startServer(hostname, port);
    print(
        'Instance #$id listening at http://${server.address.address}:${server.port}');
  });
}
