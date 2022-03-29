class Todo {
  String? title;
  String? description;
  int? timestamp;
  int? priority;
  String? user_id;
  bool? isCompleted;
  String? id;

  Todo({
    this.title,
    this.description,
    this.timestamp,
    this.priority,
    this.user_id,
    this.isCompleted,
    this.id,
  });

  static List<Todo> fromJsonList(List<dynamic> json) {
    List<Todo> todos = [];
    json.forEach((jsonTodo) {
      var jsonTodoMap = jsonTodo as Map<String, dynamic>;
      todos.add(Todo(
        title: jsonTodoMap['title'],
        description: jsonTodoMap['description'],
        timestamp: jsonTodoMap['timestamp'],
        priority: jsonTodoMap['priority'],
        user_id: jsonTodoMap['user_id'],
        isCompleted: jsonTodoMap['isCompleted'],
        id: jsonTodoMap['id'],

      ));
    });
    return todos;
  } // fromJsonList
} // End of TodoClass