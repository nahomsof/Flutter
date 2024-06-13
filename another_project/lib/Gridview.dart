import 'package:flutter/material.dart';

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
            excludeHeaderSemantics: true,
            backgroundColor: Colors.amber,
          ),
          body: Center(
            child: Container(
              width: 200,
              height: 100,
              padding: EdgeInsets.all(25),
              color: Colors.pink,
              child: Center(
                child: Text("This could be good"),
              ),
            ),
          ),
        ));
  }
}
