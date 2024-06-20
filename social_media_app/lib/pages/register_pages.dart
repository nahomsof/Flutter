import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:social_media_app/component/my_button.dart';
import 'package:social_media_app/component/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  //text controllers
  final void Function()? onTap;
  TextEditingController _username_Controller = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordControler = TextEditingController();
  TextEditingController config_passwordControler = TextEditingController();

  RegisterPage({super.key, required this.onTap});

  void register() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.person,
                size: 80,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),

              const SizedBox(
                height: 25,
              ),

              //app name
              const Text(
                "M I N I M A L",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 50,
              ),

              MyTextField(
                  hintText: "Username",
                  controller: _username_Controller,
                  obscureText: false),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                  hintText: "Email",
                  controller: emailController,
                  obscureText: false),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                  hintText: "Password",
                  controller: passwordControler,
                  obscureText: true),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                  hintText: "Confirm Password",
                  controller: config_passwordControler,
                  obscureText: true),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forgot Password?",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              MyButton(onTap: register, text: "Register"),

              //don't have an account? Register here
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      "Login",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
