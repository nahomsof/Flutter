import 'package:flutter/material.dart';

class MyHabitTile extends StatelessWidget {
  final bool inComplite;
  final String text;
  final void Function(bool?)? onChanged;
  MyHabitTile(
      {super.key,
      required this.inComplite,
      required this.text,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onChanged != null) {
          //toggle completion status
          onChanged!(!inComplite);
        }
      },
      child: Container(
          decoration: BoxDecoration(
            color: inComplite
                ? Colors.green
                : Theme.of(context).colorScheme.secondary,
          ),
          padding: const EdgeInsets.all(12),
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
          child: ListTile(
            title: Text(text),
            leading: Checkbox(
              activeColor: Colors.green,
              value: inComplite,
              onChanged: onChanged,
            ),
          )),
    );
  }
}
