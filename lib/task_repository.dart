import 'package:todo_app/task_model.dart';
import 'package:todo_app/task_storage.dart';

class TaskRepository {
  final Map<String, Task> taskMap = {};
  final TaskStorage storage = TaskStorage();

  Future<void> init() async {
    final loadedTasks = await storage.loadTasks();
    for (var task in loadedTasks) {
      taskMap[task.id] = task;
    }
  }

  // Add a new Task
  Future<void> addTask(Task newTask) async{
    taskMap[newTask.id] = newTask;
    await storage.saveTasks(getAllTasks());
  }

  Future<void> toggleTaskStatus(String id) async {
    final task = taskMap[id];
    if (task != null) {
      task.toggleDone();
      await storage.saveTasks(getAllTasks());
    }
  }

  // Remove a Task (By id)
  Future<bool> deleteTask(String idToRemove) async {
    final removed = taskMap.remove(idToRemove);
    if (removed != null) {
      await storage.saveTasks(getAllTasks());
      return true; // Successfully removed
    }
    else {
      return false; // Task not found
    }
  }

  Task? getTask(String id) {
    return taskMap[id];
  }

  List<Task> getAllTasks() {
    return taskMap.values.toList();
  }
  


}