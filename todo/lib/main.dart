import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/presentation/todo_view.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoView(),
    );
  }
}
