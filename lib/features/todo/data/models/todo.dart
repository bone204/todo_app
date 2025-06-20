import 'package:todo_app/features/todo/domain/entities/todo.dart';

class TodoModel extends TodoEntity{
  const TodoModel({
    String ? id,
    String ? title,
    String ? description,
    String ? time,
    bool ? isCompleted,
  }) : super(id: id ?? '', title: title ?? '', description: description ?? '', time: time ?? '', isCompleted: isCompleted ?? false);

  factory TodoModel.fromJson(Map <String,dynamic> map) {
    return TodoModel(
      id: map['id'] ?? "",
      title: map['title'] ?? "",
      description: map['description'] ?? "",
      time: map['time'] ?? "",
      isCompleted: map['isCompleted'] ?? false,
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

  TodoModel copyWith({
    String? id,
    String? title,
    String? description,
    String? time,
    bool? isCompleted,
  }) {
    return TodoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      time: time ?? this.time,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}