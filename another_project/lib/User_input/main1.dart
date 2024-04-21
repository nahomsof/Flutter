import 'package:another_project/User_input/pages/todo_pages.dart';
import 'package:another_project/main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ToDoPages());
  }
}
