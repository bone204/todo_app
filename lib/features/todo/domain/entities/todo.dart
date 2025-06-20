import 'package:equatable/equatable.dart';

class TodoEntity extends Equatable{
  final String id;
  final String title;
  final String description;
  final String time;
  final bool isCompleted;

  const TodoEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.time,
    this.isCompleted = false,
  });
  
  @override
  List<Object?> get props {
    return [
      id,
      title,
      description,
      time,
      isCompleted,
    ];
  }
}