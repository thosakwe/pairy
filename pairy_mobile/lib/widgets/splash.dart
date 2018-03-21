import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Splash extends StatelessWidget {
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
                var webview = new FlutterWebviewPlugin();

                webview.onUrlChanged.listen((str) async {
                  if (str.contains('auth/github/callback')) {
                    showDialog(
                      context: context,
                      child: new AlertDialog(
                        title: const Text('YEAHHHH'),
                        content: new Text(await webview
                            .evalJavascript('window.document.body.outerHTML')),
                      ),
                    );
                  }
                });

                Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
                  return new WebviewScaffold(
                    url: 'http://localhost:3000/auth/github',
                    withJavascript: true,
                    appBar: new AppBar(
                      title: const Text('Sign In'),
                    ),
                  );
                }));
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
