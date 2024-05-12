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
      required thi.text,
      required this.onChanged,
      required this.edithabit,
      required this.deleteHabit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      child: Slidable(
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
              backgroundColor: Colors.red,
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
                  borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.all(12),
              child: ListTile(
                title: Text(text,
                    style: TextStyle(
                      color: inComplite
                          ? Colors.white
                          : Theme.of(context).colorScheme.inversePrimary,
                    )),
                leading: Checkbox(
                  activeColor: Colors.green,
                  value: inComplite,
                  onChanged: onChanged,
                ),
              )),
        ),
      ),
    );
  }
}
