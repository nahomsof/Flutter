import 'package:flutter/material.dart';

class HeaderText extends StatefulWidget {
  const HeaderText({super.key});

  @override
  State<HeaderText> createState() => _HeaderTextState();
}

class _HeaderTextState extends State<HeaderText> {
  @override
  Widget build(BuildContext context) {
    return Widget(
      SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: const Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi, Welcome Back!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),
            Text(
              "Hello again , you've been missed",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            )
          ],
        ));
    );
  }
}