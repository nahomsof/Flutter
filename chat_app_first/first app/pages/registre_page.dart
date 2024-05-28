import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/componenet/my_botton.dart';
import 'package:chat_app/componenet/my_textfiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegisterPage extends StatelessWidget {
  final void Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController confirm_pwController = TextEditingController();

  // register method
  void register(BuildContext context) {
    //get atuh service
    final _auth = AuthService();
    if (_pwController.text == confirm_pwController.text) {
      try {
        _auth.signupWithEmailPassword(
            _emailController.text, _pwController.text);
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(e.toString()),
                ));
      }
    } else {
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                title: Text("Password don't match"),
              ));
    }
  }

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
          const SizedBox(
            height: 25,
          ),
          //Welcome back message
          Text(
            "Let's create an account for you",
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary, fontSize: 16),
          ),
          const SizedBox(
            height: 25,
          ),
          //email textefield
          MyTextField(
            hintText: "Email",
            obscureText: false,
            controller: _emailController,
          ),
          const SizedBox(
            height: 10,
          ),
          //pw textfield
          MyTextField(
            hintText: "Password",
            obscureText: true,
            controller: _pwController,
          ),
          const SizedBox(
            height: 10,
          ),
          MyTextField(
            hintText: "Confirm password",
            obscureText: true,
            controller: confirm_pwController,
          ),
          const SizedBox(
            height: 25,
          ),
          // login button
          MyButton(
            text: "Register",
            onTap: () => register(context),
          ),
          //rgister now
          const SizedBox(
            height: 25,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account? ",
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              GestureDetector(
                onTap: onTap,
                child: Text(
                  "Login now",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
