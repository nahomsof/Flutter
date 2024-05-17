import 'package:authentication/compontents/my_botton.dart';
import 'package:authentication/compontents/my_textfilds.dart';
import 'package:authentication/compontents/squere_tile.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  //text editing controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() {}

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
              MyTextField(
                controller: usernameController,
                hintText: "Username",
                obscureText: false,
              ),
              const SizedBox(
                height: 10,
              ),
              //password textfield
              MyTextField(
                controller: passwordController,
                hintText: "Password",
                obscureText: true,
              ),
              const SizedBox(
                height: 10,
              ),

              //forgot password?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              //sign in button
              const SizedBox(
                height: 10,
              ),
              MyBotton(
                onTap: signUserIn,
              ),
              const SizedBox(
                height: 50,
              ),
              //or continut with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    )),
                    Text("Or continue with"),
                    Expanded(
                        child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    )),
                  ],
                ),
              ),
              //google + apple sign in buttons
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquereTile(imagepath: 'lib/images/google.png'),
                  const SizedBox(
                    width: 25,
                  ),
                  SquereTile(imagepath: 'lib/images/apple.png')
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              //not a  member?  register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not a member?",
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "Regester now",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
