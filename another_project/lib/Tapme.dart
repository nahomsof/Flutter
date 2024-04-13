import "package:another_project/pages/first_page.dart";
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
    );
  }
}
