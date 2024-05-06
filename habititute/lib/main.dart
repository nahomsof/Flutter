import 'package:flutter/material.dart';
import 'package:habititute/pages/home_pages.dart';
import 'package:habititute/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
