import 'package:flutter/material.dart';

main() => runApp(app());

class app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("This shoud be image: "),
            ),
            body: Center(
              child: Image.asset("assets.beki.jpeg"),
            )));
  }
}
