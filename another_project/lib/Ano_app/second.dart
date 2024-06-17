import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(Second());
}

class Second extends StatelessWidget {
  const Second({super.key});

  @override
  Widget build(BuildContext context) {
    return My_home();
  }
}

class My_home extends StatefulWidget {
  const My_home({super.key});

  @override
  State<My_home> createState() => _My_homeState();
}

const _youAre = "You are";
const _compatible = "compatibel with\nDoris D. Developer";

class _My_homeState extends State<My_home> {
  bool _ageSwitchValue = false;
  String _messageTour = "$_youAre Not $_compatible";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Are you compatibe wth Doris"),
        ),
        body: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              _switch(),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  _button(),
                  SizedBox(
                    width: 10,
                  ),
                  _printWord()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _printWord() {
    return Text(_messageTour, textAlign: TextAlign.center);
  }

  Widget _switch() {
    return Row(
      children: [Switch(value: _ageSwitchValue, onChanged: _updateSwitch)],
    );
  }

  Widget _button() {
    return Row(
      children: <Widget>[
        ElevatedButton(onPressed: _updateMessage, child: Text("Switch"))
      ],
    );
  }

  void _updateSwitch(bool newvalue) {
    setState(() {
      _ageSwitchValue = newvalue;
    });
  }

  void _updateMessage() {
    setState(() {
      _messageTour = _youAre + (_ageSwitchValue ? " " : " Not ") + _compatible;
    });
  }
}
