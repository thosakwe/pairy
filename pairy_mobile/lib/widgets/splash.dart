import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _SplashState();
  }
}

class _SplashState extends State<Splash> {

  static const MethodChannel channel =
      const MethodChannel('com.thosakwe.pairy/url');

  @override
  void initState() {
    super.initState();

    channel.setMethodCallHandler((call) {
      if (call.method == 'url' && call.arguments is String) {
        try {
          var uri = Uri.parse(call.arguments);
          var jwt = uri.queryParameters['jwt'];

          if (jwt?.isNotEmpty != true) throw uri;

          Navigator.push(context, new MaterialPageRoute(
            builder: (_) {
              return new Scaffold(
                appBar: new AppBar(
                  title: const Text('YEEEE'),
                ),
                body: new Center(
                  child: new Text(jwt),
                ),
              );
            },
          ));
        } catch (_) {
          showDialog(
            context: context,
            child: new AlertDialog(
              title: const Text('Error'),
              content: const Text('Invalid options.'),
            ),
          );
        }
      }
    });
  }

  @override
  void deactivate() {
    new FlutterWebviewPlugin().close();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: new Padding(
        padding: const EdgeInsets.all(16.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Pairy',
              textAlign: TextAlign.center,
              textScaleFactor: 4.0,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            const Text(
              'Connect with programmers.',
              textAlign: TextAlign.center,
              textScaleFactor: 1.5,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            const Divider(height: 96.0, color: Colors.transparent),
            new RaisedButton.icon(
              elevation: 0.0,
              onPressed: () async {
                try {
                  var url = 'http://127.0.0.1:3000/auth/github';
                  var w = new FlutterWebviewPlugin();

                  w.onUrlChanged.listen((url) {
                    var uri = Uri.parse(url);
                    if (uri.scheme == 'pairy')
                      w.close();
                  });

                  await w.launch(url, withJavascript: true);

                  /*
                  Navigator.push(context, new MaterialPageRoute(builder: (_) {
                    return new WebviewScaffold(
                      url: url,
                      appBar: new AppBar(
                        title: const Text('Sign In'),
                      ),
                    );
                  }));*/
                  /*if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    showDialog(
                      context: context,
                      child: new AlertDialog(
                        title: const Text('Launch Error'),
                        content: new Text("Can't launch URL $url."),
                      ),
                    );
                  }*/
                } on PlatformException catch (e) {
                  //print('msg: ${e.message}, code: ${e.code}, d: ${e.details}');

                }
              },
              color: Colors.white,
              icon: new Icon(
                FontAwesomeIcons.github,
                color: Theme.of(context).primaryColor,
              ),
              label: new Text(
                'SIGN IN WITH GITHUB',
                style: new TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
