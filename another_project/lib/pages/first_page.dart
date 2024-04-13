import "package:another_project/pages/second_page.dart";
import "package:flutter/material.dart";

class firstpage extends StatelessWidget {
  const firstpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("1st Page"),
      ),
      drawer: Drawer(
        backgroundColor: Colors.deepPurple[100],
        child: Column(
          children: [
            DrawerHeader(
                child: Icon(
              Icons.ice_skating,
              size: 88,
            ))
          ],
        ),
      ),
    );
  }
}
