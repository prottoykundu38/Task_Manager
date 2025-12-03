import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/sign_in_screen.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = 'sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _emailTEController = TextEditingController();
  TextEditingController _firstNameTEController = TextEditingController();
  TextEditingController _lastNameTEController = TextEditingController();
  TextEditingController _mobileTEController = TextEditingController();
  TextEditingController _passwordTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(64),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Join With Us',
                // textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _emailTEController,
                decoration: const InputDecoration(hintText: 'Email'),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _firstNameTEController,
                decoration: const InputDecoration(hintText: 'First Name'),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _lastNameTEController,
                decoration: const InputDecoration(hintText: 'Last Name'),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _mobileTEController,
                decoration: const InputDecoration(hintText: 'Mobile'),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _passwordTEController,
                decoration: const InputDecoration(hintText: 'Password'),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: _onTapSignUpButton,
                child: const Icon(Icons.arrow_circle_right_outlined),
              ),
              SizedBox(
                height: 38,
              ),
              Center(
                child: RichText(
                    text: TextSpan(
                  text: "Have account? ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                  children: [
                    TextSpan(
                      text: "Sign In",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                      //.. is cascade operator
                      recognizer: TapGestureRecognizer()
                        ..onTap = _onTapSignInButton,
                    ),
                  ],
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapSignUpButton() {
    Navigator.pushNamed(context, SignInScreen.name);
  }

  void _onTapSignInButton() {
    Navigator.pop(context);
  }

  void dispose() {
    _emailTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
