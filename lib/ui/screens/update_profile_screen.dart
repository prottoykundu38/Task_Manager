import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  static const String name = 'update-profile';

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
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
        padding: const EdgeInsets.all(80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Update Profile',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _emailTEController,
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _firstNameTEController,
              decoration: const InputDecoration(
                hintText: 'First Name',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _lastNameTEController,
              decoration: const InputDecoration(
                hintText: 'Last Name',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _mobileTEController,
              decoration: const InputDecoration(
                hintText: 'Mobile',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _passwordTEController,
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: _onTapSubmitButton,
              child: Text(
                'Update',
                style: TextStyle(fontWeight: FontWeight.w100),
              ),
            ),
          ],
        ),
      )),
    );
  }

  void _onTapSubmitButton() {}

  void dispose() {
    _emailTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
