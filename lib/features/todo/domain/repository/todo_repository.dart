import 'package:todo_app/core/resources/data_state.dart';
import 'package:todo_app/features/todo/domain/entities/todo.dart';

abstract class TodoRepository {
  Future<DataState<List<TodoEntity>>> getTodos();

  Future<void> saveTodos(List<TodoEntity> todos);

  Future<void> addTodo(TodoEntity todo);

  Future<void> deleteTodo(String id);

  Future<void> completeTodo(String id);

  Future<void> editTodo(TodoEntity todo);
}