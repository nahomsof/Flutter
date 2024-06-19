import 'package:flutter/material.dart';

void main() {
  runApp(const Fifth());
}

class Fifth extends StatelessWidget {
  const Fifth({super.key});

  @override
  Widget build(BuildContext context) {
    return const Homepage();
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

enum Gender { Female, Male }

String _messageTouser = "";
Gender? _genderRadioValue;
String shorten(Gender gender) => gender.toString().replaceAll("Gender.", "");

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Are you compatible"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [_buildRadiovalue(), _buildAreaResult()],
          ),
        ),
      ),
    );
  }

  Widget _buildRadiovalue() {
    return Row(
      children: [
        Text(shorten(Gender.Female)),
        Radio(
            value: Gender.Female,
            groupValue: _genderRadioValue,
            onChanged: _updateGenderRadio),
        const SizedBox(
          width: 25.0,
        ),
        Text(shorten(Gender.Male)),
        Radio(
            value: Gender.Male,
            groupValue: _genderRadioValue,
            onChanged: _updateGenderRadio),
      ],
    );
  }

  Widget _buildAreaResult() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(onPressed: _updateText, child: Text('Submit')),
        Text(
          _messageTouser,
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  void _updateGenderRadio(Gender? newvalue) {
    setState(() {
      _genderRadioValue = newvalue;
    });
  }

  void _updateText() {
    setState(() {
      if (_genderRadioValue != null) {
        _messageTouser =
            _messageTouser = "You selected ${shorten(_genderRadioValue!)}.";
      } else {
        _messageTouser = "You selected nothing yet.";
      }
    });
  }
}
