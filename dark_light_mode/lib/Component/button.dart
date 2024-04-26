import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Color? color;
  final void Function()? onTop;
  const MyButton({super.key, required this.color, required this.onTop});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTop,
      child: Container(),
    );
  }
}
