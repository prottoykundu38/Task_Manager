import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  static const String name = '/add-new-task-screen';

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  TextEditingController _subjectTEController = TextEditingController();
  TextEditingController _descriptionTEController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
          child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add New Task ',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _subjectTEController,
              decoration: const InputDecoration(
                hintText: 'subject',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _descriptionTEController,
              maxLines: 10,
              decoration: const InputDecoration(
                hintText: 'Description',
                alignLabelWithHint: true,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            ElevatedButton(
              onPressed:  _onTapSubmitButton,
              child: Icon(Icons.arrow_circle_right_outlined),
            )
          ],
        ),
      )),
    );
  }


  void _onTapSubmitButton() {
    
  
  }

  void dispose() {
    _subjectTEController.dispose();
    _descriptionTEController.dispose();
    super.dispose();
  }
}
