class TodoModel {
  final String id;
  final String title;
  final String description;
  final String time;
  final bool isCompleted;

  TodoModel({
    required this.id,
    required this.title,
    required this.description,
    required this.time,
    this.isCompleted = false,
  });

  TodoModel copyWith({bool? isCompleted}) {
    return TodoModel(
      id: id,
      title: title,
      description: description,
      time: time,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      time: json['time'],
      isCompleted: json['isCompleted'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'time': time,
      'isCompleted': isCompleted,
    };
  }
}
