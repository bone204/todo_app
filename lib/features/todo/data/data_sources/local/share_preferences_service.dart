import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  static const _key = 'todo_list';

  SharedPrefsService(Object object);

  Future<void> saveTodoList(List<String> todosJson) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_key, todosJson);
  }

  Future<List<String>> loadTodoList() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_key) ?? [];
  }
}
