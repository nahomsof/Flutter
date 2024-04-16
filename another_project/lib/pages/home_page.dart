import 'package:flutter/material.dart';

class HomaePage extends StatelessWidget {
  const HomaePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 20, 94, 30),
        title: Text("Home Page"),
      ),
    );
  }
}
