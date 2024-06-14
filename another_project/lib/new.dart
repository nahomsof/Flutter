import 'package:flutter/material.dart';

void main() {
  runApp(first());
}

class first extends StatelessWidget {
  first({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: newwedget(),
    );
  }
}

class newwedget extends StatefulWidget {
  const newwedget({super.key});

  @override
  State<newwedget> createState() => _newwedgetState();
}

class _newwedgetState extends State<newwedget> {
  int _incri = 0;
  String changed = "You just get odd number";

  @override
  void incriment() {
    setState(() {
      _incri += 1;
      if (_incri == 0) {
        changed = "you just get 0";
      }
      changed = "You just get even number";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: incriment,
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Incrimeting value"),
            Text(_incri.toString()),
            Text(changed)
          ],
        ),
      ),
    );
  }
}
