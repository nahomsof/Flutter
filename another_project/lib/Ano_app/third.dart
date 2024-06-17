import 'package:flutter/material.dart';

void main() {
  runApp(Third());
}

class Third extends StatelessWidget {
  const Third({super.key});

  @override
  Widget build(BuildContext context) {
    return HomePage2();
  }
}

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Are yo ucompative with Doris"),),body: Padding(padding: EdgeInsets.all(12),child: Column(children: <Widget>[],),),);
  }
  Widget _buildFlutterlove(){
    return Text("On scale of 1 to 10, "  "How much do you love developing flutter ")
  }
}