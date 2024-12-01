import 'package:flutter/material.dart';
import 'package:flutter_application_2/domain/entities/task_entity.dart';

class TaskCard extends StatelessWidget {
  final TaskEntity task;

  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(task.title),
        subtitle: Text(task.description),
        trailing: Icon(task.isCompleted ? Icons.check : Icons.pending),
      ),
    );
  }
}
