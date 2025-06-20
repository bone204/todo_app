import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:todo_app/core/resources/data_state.dart';
import 'package:todo_app/features/todo/data/models/todo.dart';
import 'package:todo_app/features/todo/data/data_sources/local/share_preferences_service.dart';
import 'package:todo_app/features/todo/domain/entities/todo.dart';
import 'package:todo_app/features/todo/domain/repository/todo_repository.dart';
import 'package:todo_app/service_locator.dart';

class TodoRepositoryImpl implements TodoRepository {
  final SharedPrefsService sharedPrefsService = sl<SharedPrefsService>();

  TodoRepositoryImpl(Object object);

  Future<List<TodoModel>> _getCurrentTodos() async {
    print('--- Loading todos from SharedPreferences ---');
    final jsonList = await sharedPrefsService.loadTodoList();
    print('Raw data from SharedPreferences: $jsonList');
    List<TodoModel> result = [];
    for (var e in jsonList) {
      try {
        result.add(TodoModel.fromJson(json.decode(e)));
      } catch (err) {
        print('Error parsing todo: $e, error: $err');
      }
    }
    return result;
  }

  Future<void> _saveModels(List<TodoModel> todos) async {
    final jsonList = todos.map((todo) => json.encode(todo.toJson())).toList();
    await sharedPrefsService.saveTodoList(jsonList);
  }

  @override
  Future<DataState<List<TodoEntity>>> getTodos() async {
    try {
      final todos = await _getCurrentTodos();
      final entityList = todos.map<TodoEntity>((e) => TodoEntity(
        id: e.id,
        title: e.title,
        description: e.description,
        time: e.time,
        isCompleted: e.isCompleted,
      )).toList();
      return DataSuccess(entityList);
    } catch (e) {
      print('Error in getTodos: $e');
      return DataFailed(DioException(requestOptions: RequestOptions(path: ''), error: e));
    }
  }

  @override
  Future<void> saveTodos(List<TodoEntity> todos) async {
    await _saveModels(todos.cast<TodoModel>());
  }

  @override
  Future<void> addTodo(TodoEntity todo) async {
    final todos = await _getCurrentTodos();
    todos.add(
      todo is TodoModel
        ? todo
        : TodoModel(
            id: todo.id,
            title: todo.title,
            description: todo.description,
            time: todo.time,
            isCompleted: todo.isCompleted,
          )
    );
    await _saveModels(todos);
  }

  @override
  Future<void> deleteTodo(String id) async {
    final todos = await _getCurrentTodos();
    print('Before delete: ${todos.map((e) => e.id).toList()}');
    todos.removeWhere((t) => t.id == id);
    print('After delete: ${todos.map((e) => e.id).toList()}');
    await _saveModels(todos);
  }

  @override
  Future<void> completeTodo(String id) async {
    final todos = await _getCurrentTodos();
    final updated = todos.map((t) => t.id == id ? t.copyWith(isCompleted: !t.isCompleted) : t).toList();
    await _saveModels(updated);
  }

  @override
  Future<void> editTodo(TodoEntity todo) async {
    final todos = await _getCurrentTodos();
    final updated = todos.map((t) => t.id == todo.id
      ? (todo is TodoModel
          ? todo
          : TodoModel(
              id: todo.id,
              title: todo.title,
              description: todo.description,
              time: todo.time,
              isCompleted: todo.isCompleted,
            ))
      : t).toList();
    await _saveModels(updated);
  }
}