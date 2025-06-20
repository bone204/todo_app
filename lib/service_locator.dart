import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_app/features/todo/data/data_sources/local/share_preferences_service.dart';
import 'package:todo_app/features/todo/data/repository/todo_repository_impl.dart';
import 'package:todo_app/features/todo/domain/repository/todo_repository.dart';
import 'package:todo_app/features/todo/domain/usecases/get_todo.dart';
import 'package:todo_app/features/todo/domain/usecases/add_todo.dart';
import 'package:todo_app/features/todo/domain/usecases/delete_todo.dart';
import 'package:todo_app/features/todo/domain/usecases/complete_todo.dart';
import 'package:todo_app/features/todo/domain/usecases/edit_todo.dart';
import 'package:todo_app/features/todo/presentation/blocs/todo_bloc/todo_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<SharedPrefsService>(SharedPrefsService(sl<Dio>()));

  sl.registerSingleton<TodoRepository>(
    TodoRepositoryImpl(sl<SharedPrefsService>())
  );

  // UseCases
  sl.registerLazySingleton(() => GetTodoUseCase(sl()));
  sl.registerLazySingleton(() => AddTodoUseCase(sl()));
  sl.registerLazySingleton(() => DeleteTodoUseCase(sl()));
  sl.registerLazySingleton(() => CompleteTodoUseCase(sl()));
  sl.registerLazySingleton(() => EditTodoUseCase(sl()));

  // Bloc
  sl.registerFactory<TodoBloc>(() => TodoBloc(
    sl<GetTodoUseCase>(),
    sl<AddTodoUseCase>(),
    sl<DeleteTodoUseCase>(),
    sl<CompleteTodoUseCase>(),
    sl<EditTodoUseCase>(),
  ));
} 