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

Map<Relationship?, String?> show = {
  Relationship.Friend: "Friend",
  Relationship.OneDate: "One date",
  Relationship.Ongoing: "Ongoing relationship",
  Relationship.Committed: "Committed relationship",
  Relationship.Marriage: "Marriage",
};
List<DropdownMenuItem<Relationship>> _relationshipsList = [
  DropdownMenuItem(
    value: Relationship.Friend,
    child: Text(show[Relationship.Friend]!),
  ),
  DropdownMenuItem(
    value: Relationship.OneDate,
    child: Text(show[Relationship.OneDate]!),
  ),
  DropdownMenuItem(
    value: Relationship.Ongoing,
    child: Text(show[Relationship.Ongoing]!),
  ),
  DropdownMenuItem(
    value: Relationship.Committed,
    child: Text(show[Relationship.Committed]!),
  ),
  DropdownMenuItem(
    value: Relationship.Marriage,
    child: Text(show[Relationship.Marriage]!),
  ),
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Are you compatible with Hilda"),
          centerTitle: true,
        ),
      ),
    );
  }
}
