import 'dart:convert';
import 'package:todo_app/core/services/share_preferences_service.dart';
import 'package:todo_app/data/todo_model.dart';

class TodoRepository {
  final SharedPrefsService _prefsService;

  TodoRepository(this._prefsService);

  Future<List<TodoModel>> getTodos() async {
    final jsonList = await _prefsService.loadTodoList();
    return jsonList.map((e) => TodoModel.fromJson(json.decode(e))).toList();
  }

  Future<void> saveTodos(List<TodoModel> todos) async {
    final jsonList = todos.map((todo) => json.encode(todo.toJson())).toList();
    await _prefsService.saveTodoList(jsonList);
  }
}
