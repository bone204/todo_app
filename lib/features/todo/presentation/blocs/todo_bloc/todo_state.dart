import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/features/todo/domain/entities/todo.dart';

abstract class TodoState extends Equatable{
  final List<TodoEntity> ? todos;
  final DioException ? error;

  const TodoState({this.todos, this.error});

  @override
  List<Object?> get props => [todos, error];
}

class TodoLoading extends TodoState {
  const TodoLoading();
}

class TodoLoaded extends TodoState {
  const TodoLoaded(List<TodoEntity> todo) : super (todos: todo);
}

class TodoError extends TodoState {
  const TodoError(DioException error) : super(error: error);
}


