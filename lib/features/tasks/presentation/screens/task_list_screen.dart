import 'package:flutter/material.dart';

import '../../state/task_state.dart';
import '../../widgets/task_card.dart';

class TaskListScreen extends StatefulWidget {
  final TaskState taskState;

  const TaskListScreen({required this.taskState, Key? key}) : super(key: key);

  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch tasks when the screen loads
    widget.taskState.fetchTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Task Manager")),
      body: ValueListenableBuilder(
        valueListenable: widget.taskState.tasks,
        builder: (context, tasks, _) {
          if (tasks.isEmpty) {
            return const Center(child: Text("No tasks available"));
          }
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return TaskCard(task: task);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, "/add_task"),
        child: const Icon(Icons.add),
      ),
    );
  }
}
