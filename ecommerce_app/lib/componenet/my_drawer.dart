import 'package:ecommerce_app/componenet/my_list_tiles.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          //drawer header logo
          DrawerHeader(
            child: Center(
              child: Icon(
                Icons.shopping_bag,
                size: 72,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          //shop tile
          MyListTile(icon: Icons.home, text: "Shop", onTap: () {}),
          MyListTile(icon: Icons.shopping_cart, text: "Cart", onTap: () {}),
          MyListTile(icon: Icons.logout, text: "exit", onTap: () {}),
          //cart tile

          //exit
        ],
      ),
    );
  }
}
