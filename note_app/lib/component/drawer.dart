import 'package:flutter/material.dart';
import 'package:note_app/component/drawer_tile.dart';
import 'package:note_app/pages/settings_pages.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          DrawerHeader(child: Icon(Icons.note)),
          DrawerTiles(
              leading: Icon(Icons.home),
              title: "Notes",
              onTap: () => Navigator.pop(context)),
          DrawerTiles(
              leading: Icon(Icons.settings),
              title: "Settings",
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingPage()));
              }),
        ],
      ),
    );
  }
}
