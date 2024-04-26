import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Color? color;
  final void Function()? onTop;
  const MyButton({super.key, required this.color, required this.onTop});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTop,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(25),
        child: const Center(
          child: Text("TAP"),
        ),
      ),
    );
  }
}
