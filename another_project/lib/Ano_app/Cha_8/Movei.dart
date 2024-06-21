import 'package:another_project/Colm.dart';
import 'package:flutter/material.dart';

void main() => (runApp(Main()));

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MovieTitle(),
    );
  }
}

class MovieTitle extends StatefulWidget {
  const MovieTitle({super.key});

  @override
  State<MovieTitle> createState() => _MovieTitleState();
}

class _MovieTitleState extends State<MovieTitle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies Title"),
        centerTitle: true,
      ),
    );
  }
}
