import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/pin_verification_screen.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

class ForgotPasswordEmailScreen extends StatefulWidget {
  const ForgotPasswordEmailScreen({super.key});

  static final String name = 'forgot-password-email';

  @override
  State<ForgotPasswordEmailScreen> createState() =>
      _ForgotPasswordEmailScreenState();
}

class _ForgotPasswordEmailScreenState extends State<ForgotPasswordEmailScreen> {
  TextEditingController _emailTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Email Address',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'A 6 digit code will be sent to your email address to reset your password',
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _emailTEController,
                decoration: const InputDecoration(),
              ),
              SizedBox(
                height: 14,
              ),
              ElevatedButton(
                onPressed: _onTapSubmitButton,
                child: Icon(Icons.arrow_circle_right_outlined),
              ),
              SizedBox(
                height: 24,
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
                            fontWeight: FontWeight.bold, color: Colors.green),
                        recognizer: TapGestureRecognizer()
                          ..onTap = _onTapSignInButton),
                  ],
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapSubmitButton() {
    Navigator.pushNamed(context, PinVerificationScreen.name);
  }

  void _onTapSignInButton() {
    Navigator.pop(context);
  }

  void dispose() {
    _emailTEController.dispose();
    super.dispose();
  }
}
