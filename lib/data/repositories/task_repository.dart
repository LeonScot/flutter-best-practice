import '../../services/api_service.dart';
import '../models/task_model.dart';

class TaskRepository {
  final ApiService apiService;

  TaskRepository(this.apiService);

  Future<List<Task>> fetchTasks() async {
    final response = await apiService.get("/tasks");
    return (response as List).map((e) => Task.fromJson(e)).toList();
  }

  Future<void> addTask(Task task) async {
    await apiService.post("/tasks", task.toJson());
  }

  Future<void> updateTask(Task task) async {
    await apiService.put("/tasks/${task.id}", task.toJson());
  }

  Future<void> deleteTask(String id) async {
    await apiService.delete("/tasks/$id");
  }
}
