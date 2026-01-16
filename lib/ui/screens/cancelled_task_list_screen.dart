import 'package:flutter/material.dart';
import 'package:task_manager/data/models/task_model.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/data/urls.dart';
import 'package:task_manager/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:task_manager/ui/widgets/snack_bar_message.dart';
import 'package:task_manager/ui/widgets/task_card.dart';

class CancelledTaskListScreen extends StatefulWidget {
  const CancelledTaskListScreen({super.key});

  @override
  State<CancelledTaskListScreen> createState() =>
      _CancelledTaskListScreenState();
}

class _CancelledTaskListScreenState
    extends State<CancelledTaskListScreen> {

  bool _getCancelledTasksInProgress = true;
  List<TaskModel> _cancelledTaskList = [];

  @override
  void initState() {
    super.initState();
    _getCancelledTaskList();
  }

  @override
  Widget build(BuildContext context) {
    if (_getCancelledTasksInProgress) {
      return const CenteredCircularProgressIndicator();
    }

    if (_cancelledTaskList.isEmpty) {
      return const Center(
        child: Text(
          'No cancelled tasks found',
          style: TextStyle(fontSize: 16),
        ),
      );
    }

    return ListView.builder(
      itemCount: _cancelledTaskList.length,
      itemBuilder: (context, index) {
        return TaskCard(
          taskType: TaskType.cancelled,
          taskModel: _cancelledTaskList[index],
          onStatusUpdate: () {
            _getCancelledTaskList();
          },
        );
      },
    );
  }

  Future<void> _getCancelledTaskList() async {
    _getCancelledTasksInProgress = true;
    setState(() {});

    final NetworkResponse response =
        await NetworkCaller.getRequest(
          url: Urls.getCancelledTasksUrl,
        );

    if (response.isSuccess) {
      final List<TaskModel> list = [];

      for (final Map<String, dynamic> jsonData
          in response.body!['data']) {
        list.add(TaskModel.fromJson(jsonData));
      }

      _cancelledTaskList = list;
    } else {
      if (mounted) {
        showSnackBarMessage(
          context,
          response.errorMessage ?? 'Something went wrong',
        );
      }
    }

    _getCancelledTasksInProgress = false;
    if (mounted) {
      setState(() {});
    }
  }
}
