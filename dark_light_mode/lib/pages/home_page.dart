import 'package:dark_light_mode/Component/box.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[500],
      body: Center(
        child: MyBox(
          child: Text("Box"),
          color: Colors.deepPurple[300],
        ),
      ),
    );
  }
}
