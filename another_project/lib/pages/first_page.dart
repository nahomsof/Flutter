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
                Icons.add_to_drive,
                size: 88,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("H O M E"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/home_page');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("S E  T T I N G"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/settings_page');
              },
            )
          ],
        ),
      ),
    );
  }
}
