import '../entities/task_entity.dart';
import '../../data/repositories/task_repository.dart';
import '../../data/models/task_model.dart';

class GetTasks {
  final TaskRepository repository;

  GetTasks(this.repository);

  Future<List<TaskEntity>> fetchTasks() async {
    // Fetch tasks from repository
    final List<Task> tasks = await repository.fetchTasks();

    // Convert Task models to TaskEntity
    return tasks
        .map((task) => TaskEntity(
              task.id,
              task.title,
              task.description,
              task.isCompleted,
            ))
        .toList();
  }
}
