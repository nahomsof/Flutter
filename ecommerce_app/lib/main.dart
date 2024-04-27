import 'package:ecommerce_app/Pages/intropage.dart';
import 'package:ecommerce_app/Pages/shop_pages.dart';
import 'package:ecommerce_app/themes/light_mode.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPages(),
      theme: lightmode,
      routes: {
        '/intropage': (context) => const IntroPages(),
        '/shop_pages': (context) => const ShopPage(),
      },
    );
  }
}
