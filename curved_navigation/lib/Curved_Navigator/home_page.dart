import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _navigationitem = [
    const Icon(Icons.home),
    const Icon(Icons.dashboard),
    const Icon(Icons.shopping_cart),
    const Icon(Icons.settings),
    const Icon(Icons.person)
  ];
  Color bgcolor = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: bgcolor,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: bgcolor,
        animationDuration: const Duration(milliseconds: 200),
        items: _navigationitem,
        onTap: (index) {
          if (index == 0) {
            bgcolor = Colors.blue;
          } else if (index == 1) {
            bgcolor = Colors.yellow;
          } else if (index == 2) {
            bgcolor = Colors.red;
          } else if (index == 3) {
            bgcolor = Colors.green;
          } else if (index == 4) {
            bgcolor = Colors.teal;
          }
          setState(() {});
        },
      ),
    );
  }
}
