import 'package:get_it/get_it.dart';
import 'package:todo_app/core/services/share_preferences_service.dart';
import 'package:todo_app/features/todo/domain/todo_repository.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<SharedPrefsService>(() => SharedPrefsService());

  getIt.registerLazySingleton<TodoRepository>(() => TodoRepository());
} 