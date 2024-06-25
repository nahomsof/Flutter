import 'package:flutter/material.dart';
import 'package:number_taber_game/gamepage.dart';
import 'package:number_taber_game/gameprovider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => GameProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: GamePage(),
      ),
    );
  }
}
