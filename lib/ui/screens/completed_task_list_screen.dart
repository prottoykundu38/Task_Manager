import 'package:flutter/material.dart';
import 'package:task_manager/data/models/task_model.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/data/urls.dart';
import 'package:task_manager/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:task_manager/ui/widgets/snack_bar_message.dart';
import 'package:task_manager/ui/widgets/task_card.dart';

class CompletedTaskListScreen extends StatefulWidget {
  const CompletedTaskListScreen({super.key});

  static const String name = 'completed_task_list_screen';

  @override
  State<CompletedTaskListScreen> createState() =>
      _CompletedTaskListScreenState();
}

class _CompletedTaskListScreenState extends State<CompletedTaskListScreen> {
  bool _getCompletedTasksInProgress = true;
  List<TaskModel> _completedTaskList = [];

  @override
  void initState() {
    super.initState();
    _getCompletedTaskList();
  }

  @override
  Widget build(BuildContext context) {
    if (_getCompletedTasksInProgress) {
      return const CenteredCircularProgressIndicator();
    }

    if (_completedTaskList.isEmpty) {
      return const Center(
        child: Text(
          'No completed tasks found',
          style: TextStyle(fontSize: 16),
        ),
      );
    }

    return ListView.builder(
      itemCount: _completedTaskList.length,
      itemBuilder: (context, index) {
        return TaskCard(
          taskType: TaskType.completed,
          taskModel: _completedTaskList[index],
          onStatusUpdate: () {
            _getCompletedTaskList();
          },
        );
      },
    );
  }

  Future<void> _getCompletedTaskList() async {
    _getCompletedTasksInProgress = true;
    setState(() {});

    final NetworkResponse response =
        await NetworkCaller.getRequest(
          url: Urls.getCompletedTasksUrl,
        );

    if (response.isSuccess) {
      final List<TaskModel> list = [];

      for (final Map<String, dynamic> jsonData
          in response.body!['data']) {
        list.add(TaskModel.fromJson(jsonData));
      }

      _completedTaskList = list;
    } else {
      if (mounted) {
        showSnackBarMessage(
          context,
          response.errorMessage ?? 'Something went wrong',
        );
      }
    }

    _getCompletedTasksInProgress = false;
    if (mounted) {
      setState(() {});
    }
  }
}
