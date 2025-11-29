import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                decoration: const InputDecoration(hintText: 'Email'),
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(hintText: 'First Name'),
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Last Name'),
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Mobile'),
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Password'),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {},
                child: const Icon(Icons.arrow_circle_right_outlined),
              ),
              SizedBox(
                height: 38,
              ),
              Center(
                child: RichText(
                    text: TextSpan(
                  text: "Have account? ",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                  children: [
                    TextSpan(
                      text: "Sign In",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                      //.. is cascade operator
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pop(context);
                        },
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
}
