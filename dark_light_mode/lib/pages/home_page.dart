import 'package:dark_light_mode/Component/box.dart';
import 'package:dark_light_mode/Component/button.dart';
import 'package:dark_light_mode/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: MyBox(
          color: Theme.of(context).colorScheme.primary,
          child: MyButton(
              color: Theme.of(context).colorScheme.secondary,
              onTop: () {
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme();
              }),
        ),
      ),
    );
  }
}
