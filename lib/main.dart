import 'package:flutter/material.dart';
import 'task_model.dart';
import 'task_repository.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Summer Sprint To-Do',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const TodoHomePage(),
    );
  }
}

class TodoHomePage extends StatefulWidget {
  const TodoHomePage({super.key});

  @override
  State<TodoHomePage> createState() => _TodoHomePageState();
}

class _TodoHomePageState extends State<TodoHomePage> {
  final TaskRepository _repository = TaskRepository();
  final TextEditingController textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void addTask() {
    if (textController.text.isNotEmpty) {
      setState(() {
        _repository.addTask(
          Task(
            id: DateTime.now().toString(),
            title: textController.text,
            isDone: false,
          ),
        );
      });
      textController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Task> tasks = _repository.getAllTasks();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Summer Sprint To-Do'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      tasks[index].title,
                      style: TextStyle(
                        decoration: tasks[index].isDone
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    trailing: Checkbox(
                      value: tasks[index].isDone,
                      onChanged: (bool? value) {
                        setState(() {
                          tasks[index].isDone = value!;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 8, 16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: textController,
                      onSubmitted: (_) => addTask(),
                      decoration: const InputDecoration(
                        hintText: 'Add a new task...',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: addTask,
                    icon: const Icon(Icons.add_circle_outline),
                    tooltip: 'Add task',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
