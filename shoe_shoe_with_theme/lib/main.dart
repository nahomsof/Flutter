import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_shoe_with_theme/model/cart.dart';
import 'package:shoe_shoe_with_theme/themes/theme_provider.dart';
import 'pages/intro_pages.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      builder: ((context, child) =>  MaterialApp(
            debugShowCheckedModeBanner: false,
            home: IntroPage(),
            theme: Provider.of<ThemeProvider>(context).themeData,
          )),
    );
  }
}