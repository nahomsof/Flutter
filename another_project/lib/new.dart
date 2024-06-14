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

  @override
  void incriment() {
    setState(() {
      _incri += 1;
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
          children: [Text("Incrimeting value"), Text(_incri.toString())],
        ),
      ),
    );
  }
}
