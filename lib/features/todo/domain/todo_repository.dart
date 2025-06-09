import 'dart:convert';
import 'package:todo_app/core/services/share_preferences_service.dart';
import 'package:todo_app/features/todo/data/todo_model.dart';
import 'package:todo_app/service_locator.dart';

class TodoRepository {
  Future<List<TodoModel>> getTodos() async {
    final jsonList = await getIt<SharedPrefsService>().loadTodoList();
    return jsonList.map((e) => TodoModel.fromJson(json.decode(e))).toList();
  }

  Future<void> saveTodos(List<TodoModel> todos) async {
    final jsonList = todos.map((todo) => json.encode(todo.toJson())).toList();
    await getIt<SharedPrefsService>().saveTodoList(jsonList);
  }
}
