import 'dart:io';

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Color? color;
  final void Function()? onTop;
  const Button({super.key, required this.color, required this.onTop});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Dark mode",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          width: 40,
          height: 40,
          child: GestureDetector(
            onTap: onTop,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inversePrimary,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(8),
              child:
                  const Center(child: Icon(Icons.on_device_training_outlined)),
            ),
          ),
        ),
      ],
    );
  }
}
