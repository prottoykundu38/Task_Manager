import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/add_new_task_screen.dart';
import 'package:task_manager/ui/widgets/task_card.dart';
import 'package:task_manager/ui/widgets/task_count_summary_card.dart';

class NewTaskListScreen extends StatefulWidget {
  const NewTaskListScreen({super.key});

  @override
  State<NewTaskListScreen> createState() => _NewTaskListScreenState();
}

class _NewTaskListScreenState extends State<NewTaskListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 100,
              // width: 20,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return TaskCounterSummaryCard(
                    title: 'Progress',
                    count: '13',
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                  width: 4,
                ),
                itemCount: 6,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return TaskCard(Button: 'New', color: Colors.blue,);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onTapAddNewTask,
        child: Icon(Icons.add),
      ),
    );
  }

  void _onTapAddNewTask() {
    Navigator.pushNamed(context, AddNewTaskScreen.name);
  }
}
