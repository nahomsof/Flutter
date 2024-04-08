import 'package:flutter/material.dart';

main() => runApp(App0307());

class App0307 extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Adding Widgets"),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Hello world!",
                    textScaleFactor: 2.0,
                  ),
                  Text("It's lonely for me inside this phone.")
                ],
              ),
            )));
  }
}
