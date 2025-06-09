import 'package:todo_app/features/todo/data/todo_model.dart';

abstract class TodoState {}

class TodoInitial extends TodoState {}

class TodoLoaded extends TodoState {
  final List<TodoModel> todos;

  TodoLoaded(this.todos);
}
