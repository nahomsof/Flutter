import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

main() => runApp(const App0303());

class App0303 extends StatelessWidget {
  const App0303({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                title: const Text("My First Scaffold"),
                elevation: 100,
                systemOverlayStyle: SystemUiOverlayStyle.dark),
            body: const Center(
              child: Text("Hello world!"),
            ),
            drawer: const Drawer(
              child: Center(
                child: Text("This is drawer"),
              ),
            )));
  }
}
