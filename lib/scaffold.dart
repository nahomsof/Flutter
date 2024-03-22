import 'package:flutter/material.dart';

main() => runApp(App0303());

class App0303 extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("My First Scaffold"),
            ),
            body: Center(
              child: Text("Hello world!"),
            ),
            drawer: Drawer(
              child: Center(
                child: Text("I'm a drawer."),
              ),
            )));
  }
}
