import 'package:dark_light_mode/Component/box.dart';
import 'package:dark_light_mode/Component/button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[500],
      body: Center(
        child: MyBox(
          child: MyButton(color: Colors.blue[300], onTop: () {}),
          color: Colors.blue[200],
        ),
      ),
    );
  }
}
