import 'package:flutter/material.dart';

main() => runApp(getter());

class getter extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First Image"),
        ),
        body: Center(
          child: Image.asset('assets/beki.jpeg'),
        ),
      ),
    );
  }
}
