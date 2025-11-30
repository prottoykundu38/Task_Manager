import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/task_card.dart';

class InProgressTastListScreen extends StatefulWidget {
  const InProgressTastListScreen({super.key});

  @override
  State<InProgressTastListScreen> createState() => _InProgressTastListScreenState();
}

class _InProgressTastListScreenState extends State<InProgressTastListScreen> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return TaskCard(
            Button: 'In Progress', color: Colors.pink,
          );
        },
      ),
    );
  }
}