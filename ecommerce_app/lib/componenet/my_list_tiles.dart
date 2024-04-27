import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  void Function()? onTap;
  final String text;
  final IconData icon;
  MyListTile(
      {super.key, required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.grey,
      ),
      title: Text(text),
      onTap: onTap,
    );
  }
}
