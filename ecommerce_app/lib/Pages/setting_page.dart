import 'package:ecommerce_app/componenet/button.dart';
import 'package:ecommerce_app/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MySetting extends StatelessWidget {
  const MySetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text("Setting"),
        centerTitle: true,
      ),
      body: Button(
          color: Theme.of(context).colorScheme.secondary,
          onTop: () {
            Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
          }),
    );
  }
}
