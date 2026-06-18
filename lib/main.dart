import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final List<String> mockTasks = const [
    'Buy groceries',
    'Fix emulator bug',
    'Deploy MVP',
    'Review sprint board',
    'Prep June 23 integration notes',
    'Meow',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Summer Sprint To-Do',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Summer Sprint To-Do'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: mockTasks.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(mockTasks[index]),
                      trailing: const Icon(Icons.check_box_outline_blank),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 8, 16),
                child: Row(
                  children: [
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
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
                      onPressed: () {},
                      icon: const Icon(Icons.add_circle_outline),
                      tooltip: 'Add task',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
