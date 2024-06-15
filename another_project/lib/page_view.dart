import "package:another_project/Page_viewr.dart";
import "package:flutter/material.dart";

void main() {
  runApp(view());
}

class view extends StatelessWidget {
  final _controller = PageController();
  view({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PageView(
          scrollDirection: Axis.vertical,
          controller: _controller,
          children: [Pageone("this must be good"), Pagetwo()],
        ));
  }
}
