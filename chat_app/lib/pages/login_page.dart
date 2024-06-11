import 'package:chat_app/consts.dart';
import 'package:chat_app/services/alert_service.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/services/navigation_service.dart';
import 'package:chat_app/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 20.0,
      ),
      child: Column(
        children: [
          _headerText(),
          _loginForm(), /*_createAnAccountLink()*/
        ],
      ),
    ));
  }

  Widget _headerText() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: const Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hi, Welcome Back!",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            "Hello again, you're been missed",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }

  Widget _loginForm() {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.40,
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.sizeOf(context).height * 0.05,
      ),
      child: Form(
        //key: _loginFormKey,
        child: Column(
          children: [
            CustomFormField(
              onSaved: (value) {
                setState(() {
                  // email = value;
                });
              },
              validationRegEx: EMAIL_VALIDATION_REGEX,
              height: MediaQuery.sizeOf(context).height * 0.1,
              hintText: "Email",
            ),
            SizedBox(
              height: 10,
            ),
            CustomFormField(
              onSaved: (value) {
                setState(() {
                  // password = value;
                });
              },
              obsecureText: true,
              validationRegEx: PASSWORD_VALIDATION_REGEX,
              height: MediaQuery.sizeOf(context).height * 0.1,
              hintText: "Password",
            ),
            //_loginButton(),
          ],
        ),
      ),
    );
  }

  Widget _createAnAccountLink() {
    return const Expanded(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text("Don't have an account?"),
        Text("Sign Up", style: TextStyle(fontWeight: FontWeight.w800))
      ],
    ));
  }
}
