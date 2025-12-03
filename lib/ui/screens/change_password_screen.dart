import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/sign_in_screen.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  static const String name = 'change-password';

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool _isObscure = true;
  bool _isConfirmObscure = true;
  TextEditingController _passwordTEController = TextEditingController();
  TextEditingController _confirmPasswordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(80),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Set Password',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  'Your new password must be different from previous used passwords',
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                  // style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _passwordTEController,
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    suffixIcon: IconButton(
                        icon: Icon(_isObscure
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        }),
                  ),
                  validator: (value) =>
                      value == null || value.isEmpty || value.length < 6
                          ? 'Please enter a valid password'
                          : null,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  obscureText: _isConfirmObscure,
                  controller: _confirmPasswordTEController,
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    suffixIcon: IconButton(
                        icon: Icon(_isConfirmObscure
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isConfirmObscure = !_isConfirmObscure;
                          });
                        }),
                  ),
                  validator: (value) {
                    if (value != _passwordTEController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: _onTapConfirmButton,
                  child: Text(
                    'Confirm',
                    style: TextStyle(fontWeight: FontWeight.w100),
                  ),
                ),
                SizedBox(
                  height: 48,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Have Account? ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                      children: [
                        TextSpan(
                          text: "Sign In",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.green),
                          recognizer: TapGestureRecognizer()
                            ..onTap = _onTapSignInButton,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapConfirmButton() {
    Navigator.pushNamed(context, SignInScreen.name);
  }

  void _onTapSignInButton() {
    Navigator.pushNamedAndRemoveUntil(
        context, SignInScreen.name, (predicate) => false);
  }

  void dispose() {
    _passwordTEController.dispose();
    _confirmPasswordTEController.dispose();
    super.dispose();
  }
}
