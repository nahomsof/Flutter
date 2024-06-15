import 'package:flutter/material.dart';

class Pageone extends StatelessWidget {
  final String label;
  const Pageone(this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(label)),
      backgroundColor: Colors.blue,
    );
  }
}

class Pagetwo extends StatelessWidget {
  const Pagetwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
    );
  }
}
