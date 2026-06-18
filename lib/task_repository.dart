import 'package:todo_app/task_model.dart';

class TaskRepository {
  final Map<String, Task> taskMap = {};

  // Add a new Task
  void addTask(Task newTask) {
    taskMap[newTask.id] = newTask;
  }

  // Remove a Task (By id)
  // TODO: Have it return a code (Success/Failure)
  void deleteTask(String idToRemove) {
    taskMap.remove(idToRemove);
  }

  Task? getTask(String id) {
    return taskMap[id];
  }

  List<Task> getAllTasks() {
    return taskMap.values.toList();
  }
  


}