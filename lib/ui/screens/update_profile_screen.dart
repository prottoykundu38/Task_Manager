import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_manager/ui/screens/main_nav_holder_screen.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';
import 'package:task_manager/ui/widgets/tm_app_bar.dart';

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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _selectedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppBar(),
      body: ScreenBackground(
          child: Padding(
        padding: const EdgeInsets.all(80),
        child: Form(
          key: _formKey,
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
              _buildPhotoPicker(),
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
        ),
      )),
    );
  }

  Widget _buildPhotoPicker() {
    return Container(
      height: 50,
      width: double.maxFinite,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.white),
      child: Row(
        children: [
          Container(
            child: Center(
                child: Text(
              'Photos',
              style:
                  TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
            )),
            height: 50,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
              color: Colors.grey,
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            _selectedImage == null ? 'Selected Image' : _selectedImage!.name,
            maxLines: 1,
            style: TextStyle(
              overflow: TextOverflow.clip,
            ),
          ),
        ],
      ),
    );
  }

  void _onTapSubmitButton() {
    Navigator.pushNamed(context, MainNavHolderScreen.name);
  }

  Future<void> _onTapPhotoPicker() async {
    final XFile? pickedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      _selectedImage = pickedImage;
      setState(() {});
    }
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
