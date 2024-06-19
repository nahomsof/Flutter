import 'dart:io';

import 'package:chat_app/consts.dart';
import 'package:chat_app/model/user_profile.dart';
import 'package:chat_app/services/alert_service.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/services/database_service.dart';
import 'package:chat_app/services/media_service.dart';
import 'package:chat_app/services/navigation_service.dart';
import 'package:chat_app/services/storage_service.dart';
import 'package:chat_app/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GetIt _getIt = GetIt.instance;
  final GlobalKey<FormState> _registerFormKey = GlobalKey();
  late MediaService _mediaService;
  late NavigationService _navigationService;
  late AuthService _authService;
  late AlertService _alertService;
  late StorageService _storageService;
  late DatabaseService _databaseService;

  String? email, name, password;
  File? selectedImage;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    _mediaService = _getIt.get<MediaService>();
    _navigationService = _getIt.get<NavigationService>();
    _authService = _getIt.get<AuthService>();
    _alertService = _getIt.get<AlertService>();
    _storageService = _getIt.get<StorageService>();
    _databaseService = _getIt.get<DatabaseService>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _headerText(),
              if (!isLoading) _registerForm(),
              if (!isLoading) _loginAccountLink(),
              if (isLoading)
                const Expanded(
                    child: Center(
                  child: CircularProgressIndicator(),
                ))
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerText() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Let's, get going!",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),
          Text(
            "Register an account using the form below",
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w500, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _registerForm() {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.60,
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.sizeOf(context).height * 0.05,
      ),
      child: Form(
        key: _registerFormKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _pfpSelctionField(),
            SizedBox(
              height: 10,
            ),
            CustomFormField(
                hintText: "Name",
                height: MediaQuery.sizeOf(context).height * 0.1,
                validationRegEx: NAME_VALIDATION_REGEX,
                onSaved: (value) {
                  setState(() {
                    name = value;
                  });
                }),
            CustomFormField(
                hintText: "Email",
                height: MediaQuery.sizeOf(context).height * 0.1,
                validationRegEx: EMAIL_VALIDATION_REGEX,
                onSaved: (value) {
                  setState(() {
                    email = value;
                  });
                }),
            CustomFormField(
                obsecureText: true,
                hintText: "Password",
                height: MediaQuery.sizeOf(context).height * 0.1,
                validationRegEx: PASSWORD_VALIDATION_REGEX,
                onSaved: (value) {
                  setState(() {
                    password = value;
                  });
                }),
            _registerButton(),
          ],
        ),
      ),
    );
  }

  Widget _pfpSelctionField() {
    return GestureDetector(
      onTap: () async {
        File? file = await _mediaService.getImageFromGallery();
        if (file != null) {
          setState(() {
            selectedImage = file;
          });
        }
      },
      child: CircleAvatar(
        radius: MediaQuery.of(context).size.width * 0.15,
        backgroundImage: selectedImage != null
            ? FileImage(selectedImage!)
            : NetworkImage(PLACEHOLDER_PFP) as ImageProvider,
      ),
    );
  }

  Widget _registerButton() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: MaterialButton(
        color: Theme.of(context).colorScheme.primary,
        onPressed: () async {
          setState(() {
            isLoading = true;
          });
          try {
            if ((_registerFormKey.currentState?.validate() ?? false) &&
                selectedImage != null) {
              _registerFormKey.currentState?.save();
              bool result = await _authService.signUp(email!, password!);
              if (result) {
                String? pfpURL = await _storageService.uploaduserPfp(
                    file: selectedImage!, uid: _authService.user!.uid);
                if (pfpURL != null) {
                  await _databaseService.createUserProfile(
                      userProfile: UserProfile(
                          name: name,
                          pfpURL: pfpURL,
                          uid: _authService.user!.uid));
                  _alertService.showToast(
                    text: "User registerd successfully!",
                    icon: Icons.check,
                  );
                  _navigationService.goBack();
                  _navigationService.pushReplacementNamed("/home");
                } else {
                  throw Exception("Unable to upload user profile picture");
                }
              } else {
                throw Exception("Unable to register user");
              }
            }
          } catch (e) {
            print(e);
            _alertService.showToast(
              text: "Failed to register, Please try again!",
              icon: Icons.error,
            );
          }
          setState(() {
            isLoading = false;
          });
        },
        child: const Text(
          "Register",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _loginAccountLink() {
    return Expanded(
        child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text("Already have an account? "),
        GestureDetector(
          onTap: () {
            _navigationService.goBack();
          },
          child: const Text(
            "Login",
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
        )
      ],
    ));
  }
}
