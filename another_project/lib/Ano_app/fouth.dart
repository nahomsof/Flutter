import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(Fouth());
}

class Fouth extends StatelessWidget {
  const Fouth({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomePage3();
  }
}

class HomePage3 extends StatefulWidget {
  const HomePage3({super.key});

  @override
  State<HomePage3> createState() => _HomePage3State();
}

const _youAre = "You are";
const _compatible = "compatibel with\nDoris D. Developer";

class _HomePage3State extends State<HomePage3> {
  TextEditingController? _nameFieldController, _incomeFieldController;
  String? _messagetouser;

  @override
  void initState() {
    super.initState();
    _nameFieldController = TextEditingController();
    _incomeFieldController = TextEditingController();
    _messagetouser = "";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Are you compatible with lrving"),
        ),
        body: Column(
          children: [
            _buildnameTextField(),
            SizedBox(
              height: 10,
            ),
            _buildIncomeTextField(),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [_button(), _text()],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildnameTextField() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: TextField(
        controller: _nameFieldController,
        decoration: _builddecration("Your name"),
      ),
    );
  }

  Widget _button() {
    return Row(
      children: [
        ElevatedButton(onPressed: _updateResult, child: const Text("Switch"))
      ],
    );
  }

  Widget _buildIncomeTextField() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: TextField(
        controller: _incomeFieldController,
        decoration: _builddecration("Your income"),
        keyboardType: TextInputType.number,
      ),
    );
  }

  Widget _text() {
    return Text(
      _messagetouser!,
      textAlign: TextAlign.center,
    );
  }

  void _updateResult() {
    bool _richuser = int.parse(_incomeFieldController!.text) >= 10000;
    setState(() {
      _messagetouser = _nameFieldController!.text +
          "\n" +
          _youAre +
          (_richuser ? " " : " Not ") +
          _compatible;
    });
  }

  @override
  void dispose() {
    _nameFieldController?.dispose();
    _incomeFieldController?.dispose();
    super.dispose();
  }

  InputDecoration _builddecration(String label) {
    return InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))));
  }
}
