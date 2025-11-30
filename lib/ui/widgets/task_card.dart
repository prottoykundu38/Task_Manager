import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.Button,
    required this.color,
  });

  final String Button;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Title will be here',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                'description',
                style: TextStyle(color: Colors.black54),
              ),
              Text('12-12-2025'),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Chip(
                    backgroundColor: color,
                    label: Text(
                      '$Button',
                      style: TextStyle(color: Colors.white),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide.none,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: _onTapEditButton,
                    icon: Icon(
                      Icons.edit,
                      color: Colors.green,
                    ),
                  ),
                  IconButton(
                    onPressed: _onTapDeleteButton,
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onTapEditButton() {}

  void _onTapDeleteButton() {}
}
