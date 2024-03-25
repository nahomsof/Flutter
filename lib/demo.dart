import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgh:).dart';

main() => runApp(demo());

class demo extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
