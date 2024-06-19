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
      home: Scaffold(
        appBar: AppBar(
          title: Text("Are you compatible"),
          centerTitle: true,
        ),
      ),
    );
  }
}
