import 'dart:ffi';

import 'package:another_project/Todo_App/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Newapp());
}

class Newapp extends StatelessWidget {
  const Newapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

const _youAre = "You are";
const _compatible = "compatibel with\nDoris D. Developer";

class _MyHomePageState extends State<MyHomePage> {
  bool _ageSwitchValue = false;

  String _messageTour = "$_youAre Not $_compatible";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Are you compatible with Doris?"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[_buildAgeSwitch(), _buildResultArea()],
        ),
      ),
    );
  }

  Widget _buildAgeSwitch() {
    return Row(
      children: <Widget>[
        Switch(
            inactiveTrackColor: Colors.white,
            activeTrackColor: Colors.green,
            value: _ageSwitchValue,
            onChanged: _updateAgeSwitch)
      ],
    );
  }

  Widget _buildResultArea() {
    return Text(
      _messageTour,
      textAlign: TextAlign.center,
    );
  }

  void _updateAgeSwitch(bool newvalue) {
    setState(() {
      _ageSwitchValue = newvalue;
      _messageTour = _youAre + (_ageSwitchValue ? " " : " NOT ") + _compatible;
    });
  }
}
