import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              //logo
              Icon(
                Icons.lock,
                size: 100,
              ),
              SizedBox(
                height: 50,
              ),
              //welcome back, you have been missed!
              Text(
                "Welcome back, you've been missed!",
                style: TextStyle(color: Colors.grey[700], fontSize: 16),
              ),
              SizedBox(
                height: 50,
              ),
              //username textfield
              TextField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white))),
              )

              //password textfield

              //forgot password?

              //sign in button

              //or continut with

              //google + apple sign in buttons

              //not a  member?  register now
            ],
          ),
        ),
      ),
    );
  }
}
