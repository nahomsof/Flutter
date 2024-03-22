import 'package:flutter/material.dart';

main() => runApp(App0301());

class App0301 extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Adding Widgets"),
          ),
          body: const Column(
            children: [
              Text(
                "Hello world!",
                textScaleFactor: 2.0,
              ),
              Text("It's lonely for me inside this phone."),
              Text("That must be taugh")
            ],
          )),
    );
  }
}
