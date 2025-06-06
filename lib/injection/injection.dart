import 'package:get_it/get_it.dart';
import 'package:todo_app/core/services/share_preferences_service.dart';
import 'package:todo_app/data/todo_repository.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  // Services
  getIt.registerLazySingleton<SharedPrefsService>(() => SharedPrefsService());

  // Repositories
  getIt.registerLazySingleton<TodoRepository>(() => TodoRepository());
} 