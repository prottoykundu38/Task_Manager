import 'package:flutter/material.dart';
import 'package:task_manager/data/models/task_model.dart';
import 'package:task_manager/data/models/task_status_count_model.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/data/urls.dart';
import 'package:task_manager/ui/screens/add_new_task_screen.dart';
import 'package:task_manager/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:task_manager/ui/widgets/snack_bar_message.dart';
import 'package:task_manager/ui/widgets/task_card.dart';
import 'package:task_manager/ui/widgets/task_count_summary_card.dart';

class NewTaskListScreen extends StatefulWidget {
  const NewTaskListScreen({super.key});

  @override
  State<NewTaskListScreen> createState() => _NewTaskListScreenState();
}

class _NewTaskListScreenState extends State<NewTaskListScreen> {
  bool _getNewTasksInProgress = false;
  bool _getTaskStatusCountInProgress = false;

  List<TaskModel> _newTaskList = [];
  List<TaskStatusCountModel> _taskStatusCountList = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getNewTaskList();
      _getTaskStatusCountList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            const SizedBox(height: 16),

            /// Task status summary
            SizedBox(
              height: 100,
              child: Visibility(
                visible: !_getTaskStatusCountInProgress,
                replacement: const CenteredCircularProgressIndicator(),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _taskStatusCountList.length,
                  itemBuilder: (context, index) {
                    final status = _taskStatusCountList[index];
                    return TaskCounterSummaryCard(
                      title: status.id,
                      count: status.count.toString(),
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(width: 4),
                ),
              ),
            ),

            /// Task list
            Expanded(
              child: Visibility(
                visible: !_getNewTasksInProgress,
                replacement: const CenteredCircularProgressIndicator(),
                child: ListView.builder(
                  itemCount: _newTaskList.length,
                  itemBuilder: (context, index) {
                    final task = _newTaskList[index];
                    return TaskCard(
                      key: ValueKey(task.id),
                      taskType: TaskType.tNew,
                      taskModel: task,
                      onStatusUpdate: () {
                        _getNewTaskList();
                        _getTaskStatusCountList();
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onTapAddNewTaskButton,
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _getNewTaskList() async {
    _getNewTasksInProgress = true;
    setState(() {});

    final response = await NetworkCaller.getRequest(url: Urls.getNewTasksUrl);

    if (response.isSuccess) {
      _newTaskList = (response.body!['data'] as List)
          .map((e) => TaskModel.fromJson(e))
          .toList();
    } else {
      if (mounted) {
        showSnackBarMessage(context, response.errorMessage!);
      }
    }

    _getNewTasksInProgress = false;
    if (mounted) setState(() {});
  }

  Future<void> _getTaskStatusCountList() async {
    _getTaskStatusCountInProgress = true;
    setState(() {});

    final response =
        await NetworkCaller.getRequest(url: Urls.getTaskStatusCountUrl);

    if (response.isSuccess) {
      _taskStatusCountList = (response.body!['data'] as List)
          .map((e) => TaskStatusCountModel.fromJson(e))
          .toList();
    } else {
      if (mounted) {
        showSnackBarMessage(context, response.errorMessage!);
      }
    }

    _getTaskStatusCountInProgress = false;
    if (mounted) setState(() {});
  }

  void _onTapAddNewTaskButton() {
    Navigator.pushNamed(context, AddNewTaskScreen.name);
  }
}
