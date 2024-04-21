import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToDoPages extends StatefulWidget {
  const ToDoPages({super.key});

  @override
  State<ToDoPages> createState() => _ToDoPagesState();
}

class _ToDoPagesState extends State<ToDoPages> {
  TextEditingController mycontroller = TextEditingController();
  String greetingmessages = "";
  //greet user methods
  void greetuser() {
    greetingmessages = "Hello, " + mycontroller.text;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //greeting user messege
              Text(greetingmessages),
              TextField(
                controller: mycontroller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Type you name.."),
              ),
              ElevatedButton(onPressed: greetuser, child: Text("Tap"))
            ],
          ),
        ),
      ),
    ));
  }
}
