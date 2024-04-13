import "package:flutter/material.dart";

void main() {
  runApp(exApp());
}

class exApp extends StatelessWidget {
  exApp({super.key});
  List name = ['Nahom', 'Sileshi', "Admasu"];

  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: ListView.builder(
          itemCount: name.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(name[index]),
          ),
        )));
  }
}
