import 'dart:convert';

class Task {
  String title;
  String description;
  bool? isCompleted;

  Task({
    required this.title,
    required this.description,
    this.isCompleted = false,
  });

  //Convert Task to Map
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
    };
  }

  //Convert Map back to Task
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'],
      description: map['description'],
      isCompleted: map['isCompleted'],
    );
  }

  //Encode to Json String
  String toJson() {
    return json.encode(toMap());
  }

  //Decode Json String back to task
  factory Task.fromJson(String source) {
    return Task.fromMap(json.decode(source));
  }
}
