import 'package:flutter/foundation.dart';
import '../../../domain/usecases/get_tasks.dart';
import '../../../domain/entities/task_entity.dart';

class TaskState {
  final GetTasks getTasks;

  ValueNotifier<List<TaskEntity>> tasks = ValueNotifier([]);

  TaskState(this.getTasks);

  Future<void> fetchTasks() async {
    try {
      // Fetch tasks using the GetTasks use case
      final taskEntities = await getTasks.fetchTasks();
      tasks.value = taskEntities; // Update the ValueNotifier
    } catch (e) {
      print("Error fetching tasks: $e");
    }
  }
}
