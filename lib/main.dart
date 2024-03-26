import 'package:flutter/material.dart';
import 'package:flutter_application_1/counter_page.dart';


main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(debugShowCheckedModeBanner: false,
    title: 'Widget communiation',
    home: CounterPage(),
  }
}