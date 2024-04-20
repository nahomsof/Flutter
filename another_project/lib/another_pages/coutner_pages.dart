import 'package:flutter/material.dart';

class Coutner_Pages extends StatefulWidget {
  const Coutner_Pages({super.key});

  @override
  State<Coutner_Pages> createState() => _Coutner_PagesState();
}

class _Coutner_PagesState extends State<Coutner_Pages> {
  int _counter = 0;
  void _increamentCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("You pushed this button this times: ")],
        ),
      ),
    );
  }
}
