import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Image.asset(
              'lib/Images/logo.png',
              height: 240,
            ),
          ),
          const SizedBox(
            height: 48,
          ),
          Text(
            'Just Do It',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            'Brand new sneakers and custom kicks made with premium quility',
            style: TextStyle(fontSize: 16, color: Colors.grey),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
