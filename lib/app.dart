import 'package:flutter/material.dart';
import 'services/api_service.dart';
import 'core/constants.dart';
import 'core/theme.dart';
import 'features/tasks/presentation/screens/task_list_screen.dart';
import 'features/tasks/presentation/screens/add_task_screen.dart';
import 'features/tasks/state/task_state.dart';
import 'data/repositories/task_repository.dart';
import 'domain/usecases/get_tasks.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Create TaskState with necessary dependencies
    final taskState = TaskState(GetTasks(TaskRepository(ApiService(baseUrl))));

    return MaterialApp(
      title: 'Task Manager',
      theme: lightTheme,
      darkTheme: darkTheme,
      routes: {
        "/": (context) => TaskListScreen(taskState: taskState),
        "/add_task": (context) => AddTaskScreen(
              onSave: (title, description) {
                print("Task Saved: $title, $description");
              },
            ),
      },
    );
  }
}
