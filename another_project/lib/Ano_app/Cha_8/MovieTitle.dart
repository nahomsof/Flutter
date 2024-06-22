
import 'package:flutter/material.dart';


class MovieTitle extends StatefulWidget {
 MovieTitle({super.key});

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
      body: Padding(padding: EdgeInsets.all(16),
      child: Center(child: bui,),),
    );
  }
}

