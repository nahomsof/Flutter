import 'package:flutter/material.dart';

void main() {
  runApp(Sixth());
}

class Sixth extends StatelessWidget {
  const Sixth({super.key});

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

enum Relationship {
  Friend,
  OneDate,
  Ongoing,
  Committed,
  Marriage,
}

Map<Relationship, String> show = {
  Relationship.Friend: "Friend",
  Relationship.OneDate: "One date",
  Relationship.Ongoing: "Ongoing relationship",
  Relationship.Committed: "Committed relationship",
  Relationship.Marriage: "Marriage",
};

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Are you compatible with Hilda"),
          centerTitle: true,
        ),
      ),
    );
  }
}
