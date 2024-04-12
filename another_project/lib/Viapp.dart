import 'package:flutter/material.dart';

void main() {
  runApp(Firstapp());
}

class Firstapp extends StatelessWidget {
  const Firstapp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Color.fromARGB(255, 124, 72, 131),
            appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 58, 11, 77),
              title: Text(
                "App for Nothing",
              ),
              elevation: 100,
              leading: Icon(Icons.menu),
            ),
            body: Center(
              child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(70)),
                  padding: EdgeInsets.all(25),
                  child: Icon(
                    Icons.accessibility_rounded,
                    color: Color.fromARGB(255, 23, 29, 56),
                    size: 67,
                  )),
            )));
  }
}
