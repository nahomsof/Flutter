import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  ToDoTile(
      {required this.taskCompleted,
      required this.taskName,
      required this.onChanged,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Container(
        child: Row(
          children: [
            // checkbox
            Checkbox(value: taskCompleted, onChanged: onChanged),
            //task name
            Text(taskName),
          ],
        ),
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
            color: Colors.yellow, borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
