import 'package:flutter/material.dart';

void main() {
  runApp(ex2());
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
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (context, index) => Container(
                      color: Colors.deepPurple,
                      margin: EdgeInsets.all(3),
                    ))));
  }
}
