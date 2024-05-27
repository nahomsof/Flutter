import 'package:flutter/material.dart';
import 'package:social_media_app/Themes/dark_mode.dart';
import 'package:social_media_app/Themes/light_mode.dart';
import 'package:social_media_app/auth/login_or_register.dart';
import 'package:social_media_app/pages/Login_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginOrRegister(),
      theme: lightMode,
      darkTheme: darkMode,
    );
  }
}
