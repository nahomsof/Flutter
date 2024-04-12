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
            backgroundColor: const Color.fromARGB(255, 14, 8, 24),
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
                    color: const Color.fromARGB(255, 51, 47, 47),
                    size: 67,
                  )),
            )));
}
