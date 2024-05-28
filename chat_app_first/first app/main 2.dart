import 'package:chat_app/Themes/light_mode.dart';
import 'package:chat_app/Themes/theme.provider.dart';
import 'package:chat_app/services/auth/auth_gate.dart';
import 'package:chat_app/services/auth/login_or_register.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/pages/login_pages.dart';
import 'package:chat_app/pages/registre_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

void main() async {
  await setup();
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthGate(),
        theme: Provider.of<ThemeProvider>(context).themeData);
  }
}
