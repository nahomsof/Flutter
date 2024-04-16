import "package:flutter/material.dart";

class firstpaged extends StatelessWidget {
  const firstpaged({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("1st Page"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
        ],
      ),
    );
  }
}
