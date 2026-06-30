class Task {
  String id;
  String title;
  bool isDone;

  // Named Parameters Constructor
  Task({
    required this.id,
    required this.title,
    this.isDone = false // Defaults to 'false'
  });


  Map<String, dynamic> toJson() { // Convert Task object to JSON
    return {
      'id': id,
      'title': title,
      'isDone': isDone,
    };
  }

  factory Task.fromJson(Map<String, dynamic> json) { // Create Task object from JSON
    return Task(
      id: json['id'],
      title: json['title'],
      isDone: json['isDone'],
    );
  }

  void toggleDone() {
    isDone = !isDone;
  }
}