import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/data/urls.dart';
import 'package:task_manager/ui/screens/change_password_screen.dart';
import 'package:task_manager/ui/screens/sign_in_screen.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({super.key});

  static const String name = 'pin-verification';

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
  String otp = '';
  bool _verifyInProgress = false;
  late String email;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    email = args['email'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.only(top: 200, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pin Verification',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 4),
              const Text(
                'Enter the verification code sent to your email address',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const SizedBox(height: 12),
              PinCodeTextField(
                length: 6,
                keyboardType: TextInputType.number,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeColor: Colors.green,
                  selectedColor: Colors.green,
                  inactiveColor: Colors.grey,
                ),
                backgroundColor: Colors.transparent,
                appContext: context,
                onChanged: (value) {
                  otp = value;
                },
              ),
              const SizedBox(height: 20),
              Visibility(
                visible: !_verifyInProgress,
                replacement:
                    const Center(child: CircularProgressIndicator()),
                child: ElevatedButton(
                  onPressed: _onTapVerifyButton,
                  child: const Text('Verify'),
                ),
              ),
              const SizedBox(height: 48),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Have an account? ",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                    children: [
                      TextSpan(
                        text: "Sign In",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
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
    );
  }

  Future<void> _onTapVerifyButton() async {
    if (otp.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Enter 6 digit OTP")),
      );
      return;
    }

    _verifyInProgress = true;
    setState(() {});

    final url = Urls.recoveryVerifyEmail(email, int.parse(otp));
    final response = await NetworkCaller.getRequest(url: url);

    _verifyInProgress = false;
    if (!mounted) return;
    setState(() {});

    if (response.isSuccess) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        ChangePasswordScreen.name,
        (predicate) => false,
        arguments: {"email": email, "otp": otp},
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(response.errorMessage ?? "OTP verification failed")),
      );
    }
  }

  void _onTapSignInButton() {
    Navigator.pushNamedAndRemoveUntil(
        context, SignInScreen.name, (predicate) => false);
  }
}
