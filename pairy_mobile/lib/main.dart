import 'package:flutter/material.dart';
import 'widgets/splash.dart';

void main() => runApp(new PairyApp());

class PairyApp extends StatefulWidget {

  @override
  State createState() {
    return new _PairyAppState();
  }
}

class _PairyAppState extends State<PairyApp> {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new SplashScreen(),
    );
  }
}