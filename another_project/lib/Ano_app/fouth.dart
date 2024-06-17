import 'package:flutter/material.dart';

void main() {
  runApp(Fouth());
}

class Fouth extends StatelessWidget {
  const Fouth({super.key});

  @override
  Widget build(BuildContext context) {
    return HomePage3();
  }
}

class HomePage3 extends StatefulWidget {
  const HomePage3({super.key});

  @override
  State<HomePage3> createState() => _HomePage3State();
}

class _HomePage3State extends State<HomePage3> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}
