import "package:another_project/pages/first_page.dart";
import "package:another_project/pages/home_page.dart";
import "package:another_project/pages/second_page.dart";
import "package:another_project/pages/settings_page.dart";
import "package:flutter/material.dart";

void main() {
  runApp(ex4());
}

class ex4 extends StatelessWidget {
  ex4({super.key});
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: firstpage(),
      routes: {
        '/firstpage': (context) => firstpage(),
        '/home_page': (context) => HomaePage(),
        '/settings_page': (context) => Settings_Page(),
      },
    );
  }
}
