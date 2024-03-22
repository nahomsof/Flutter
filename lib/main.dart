import 'package:flutter/material.dart';

main() => runApp(App0301());

class App0301 extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: Text("Hello world!",
            textScaleFactor: 2.0, style: TextStyle(fontSize: 28.0)),
      ),
    );
  }
}
