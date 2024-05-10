import 'package:flutter/material.dart';

class MyHabitTile extends StatelessWidget {
  final bool inComplite;
  final String text;
  const MyHabitTile({super.key, required this.inComplite, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: inComplite
              ? Colors.green
              : Theme.of(context).colorScheme.secondary,
        ),
        padding: const EdgeInsets.all(12),
        child: Text(text),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
        child: ListTile(
          title: Text(),
        ));
  }
}
