import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void main() {
  runApp(other());
}

class ex2 extends StatelessWidget {
  ex2({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text("GridView"),
            ),
            body: GridView.builder(
                itemCount: 100,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (context, index) => Container(
                      color: Colors.deepPurple,
                      margin: const EdgeInsets.all(3),
                    ))));
  }
}

class other extends StatelessWidget {
  other({super.key});
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.amber,
            title: Text(
              "New",
            ),
          ),
          body: const Center(
            child: Material(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "This must be good",
                    selectionColor: Colors.amber,
                  ),
                  Text("this must be good again")
                ],
              ),
            ),
          ),
        ));
  }
}
