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


  void toggleDone() {
    isDone = !isDone;
  }
}