import 'package:chat_app/componenet/my_textfiled.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //logo
          Icon(
            Icons.message,
            size: 60,
            color: Theme.of(context).colorScheme.primary,
          ),
          //Welcome back message
          Text(
            "Welcome back, you've been missed",
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary, fontSize: 16),
          ),
          const SizedBox(
            height: 25,
          ),
          //email textefield
          MyTextField(
            hintText: "Email",
          ),
          const SizedBox(
            height: 10,
          ),
          //pw textfield
          MyTextField(hintText: "Password")
          //rgister now
        ],
      ),
    );
  }
}
