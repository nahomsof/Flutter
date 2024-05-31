import 'package:_provider/Themes/theme.provider.dart';
import 'package:_provider/rovider/counter_model.dart';
import 'package:_provider/rovider/home_page.dart';
import 'package:_provider/Themes/light_mode.dart';
import 'package:_provider/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
