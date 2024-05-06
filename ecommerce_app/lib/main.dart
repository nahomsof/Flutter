import 'package:ecommerce_app/Pages/cart_page.dart';
import 'package:ecommerce_app/Pages/intropage.dart';
import 'package:ecommerce_app/Pages/settings_pages.dart';

import 'package:ecommerce_app/Pages/shop_pages.dart';
import 'package:ecommerce_app/models/shop.dart';
import 'package:ecommerce_app/theme/theme_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Shop(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
      ],
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
      home: const IntroPages(),
      theme: Provider.of<ThemeProvider>(context).themeData,
      routes: {
        '/intropage': (context) => const IntroPages(),
        '/shop_pages': (context) => const ShopPage(),
        '/cart_page': (context) => const CartPage(),
        '/settings_pages': (context) => const SettingPage(),
      },
    );
  }
}
