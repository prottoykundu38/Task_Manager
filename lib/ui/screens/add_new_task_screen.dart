import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';
import 'package:task_manager/ui/widgets/tm_app_bar.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  static const String name = '/add-new-task-screen';

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  TextEditingController _subjectTEController = TextEditingController();
  TextEditingController _descriptionTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppBar(),
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add New Task',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  validator: (value) => value == null || value.isEmpty
                      ? 'Subject can not be empty'
                      : null,
                  controller: _subjectTEController,
                  decoration: const InputDecoration(hintText: 'subject'),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  validator: (value) => value == null || value.isEmpty
                      ? 'Description can not be empty'
                      : null,
                  controller: _descriptionTEController,
                  maxLines: 10,
                  decoration: const InputDecoration(
                    hintText: 'Description',
                    alignLabelWithHint: true,
                  ),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: _onTapSubmitButton,
                  child: const Icon(Icons.arrow_circle_right_outlined),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSubmitButton() {}

  void dispose() {
    _subjectTEController.dispose();
    _descriptionTEController.dispose();
    super.dispose();
  }
}
