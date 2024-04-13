import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            //first box

            Container(
              width: 350,
              color: Colors.deepPurple,
            ),

            //second box
            Container(
              width: 350,
              color: Colors.deepPurple[400],
            ),

            //third box
            Container(
              width: 350,
              color: Colors.deepPurple[200],
            ),
          ],
        )));
  }
}
