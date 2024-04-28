import 'package:ecommerce_app/Pages/cart_page.dart';
import 'package:ecommerce_app/Pages/intropage.dart';
import 'package:ecommerce_app/Pages/shop_pages.dart';
import 'package:ecommerce_app/models/shop.dart';
import 'package:ecommerce_app/themes/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Shop(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPages(),
      theme: lightmode,
      routes: {
        '/intropage': (context) => const IntroPages(),
        '/shop_pages': (context) => const ShopPage(),
        '/cart_page': (context) => const CartPage(),
      },
    );
  }
}
