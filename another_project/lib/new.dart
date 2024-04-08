import 'package:flutter/material.dart';

main() => runApp(app());

class app extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(child: Center(child: Text(highlight("look at mee!!")))),
    );
  }

  highlight(word) {
    return "***" + word + "***";
  }
}
