import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MyHabitTile extends StatelessWidget {
  final bool inComplite;
  final String text;
  void Function(BuildContext)? edithabit;
  void Function(BuildContext)? deleteHabit;
  final void Function(bool?)? onChanged;
  MyHabitTile(
      {super.key,
      required this.inComplite,
      required this.text,
      required this.onChanged,
      required this.edithabit,
      required this.deleteHabit});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: edithabit,
            backgroundColor: Colors.grey.shade800,
            icon: Icons.settings,
            borderRadius: BorderRadius.circular(8),
          ),
          SlidableAction(
            onPressed: deleteHabit,
            backgroundColor: Colors.grey.shade800,
            icon: Icons.delete,
            borderRadius: BorderRadius.circular(8),
          ),
        ],
      ),
      child: GestureDetector(
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
      ),
    );
  }
}
