import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/utils/get_date_time_now.dart';
import 'package:todo_app/features/todo/data/todo_model.dart';
import 'package:todo_app/features/todo/domain/todo_repository.dart';
import 'package:todo_app/service_locator.dart';
import 'package:uuid/uuid.dart';

import 'todo_event.dart';
import 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final uuid = Uuid();

  TodoBloc() : super(TodoInitial()) {
    on<LoadTodos>(_onLoadTodos);
    on<AddTodo>(_onAddTodo);
    on<DeleteTodo>(_onDeleteTodo);
    on<CompleteTodo>(_onCompleteTodo);
    on<EditTodo>(_onEditTodo);
  }

  Future<void> _onLoadTodos(LoadTodos event, Emitter<TodoState> emit) async {
    final todos = await getIt<TodoRepository>().getTodos();
    emit(TodoLoaded(todos));
  }

  Future<void> _onAddTodo(AddTodo event, Emitter<TodoState> emit) async {
    if (state is TodoLoaded) {
      final todos = List<TodoModel>.from((state as TodoLoaded).todos)
        ..add(TodoModel(id: uuid.v4(), title: event.title, description: event.description, time: getDateTimeNow()));
      await getIt<TodoRepository>().saveTodos(todos);
      emit(TodoLoaded(todos));
    }
  }

  Future<void> _onCompleteTodo(CompleteTodo event, Emitter<TodoState> emit) async {
    if (state is TodoLoaded) {
      final currentState = state as TodoLoaded;

      final updatedTodos = currentState.todos.map((todo) {
        if (todo.id == event.id) {
          return todo.copyWith(isCompleted: !todo.isCompleted);
        }
        return todo;
      }).toList();

      await getIt<TodoRepository>().saveTodos(updatedTodos);
      emit(TodoLoaded(updatedTodos));
    }
  }

  Future<void> _onDeleteTodo(DeleteTodo event, Emitter<TodoState> emit) async {
    if (state is TodoLoaded) {
      final todos = (state as TodoLoaded).todos.where((todo) => todo.id != event.id).toList();
      await getIt<TodoRepository>().saveTodos(todos);
      emit(TodoLoaded(todos));
    }
  }

  Future<void> _onEditTodo(EditTodo event, Emitter<TodoState> emit) async {
    if (state is TodoLoaded) {
      final currentState = state as TodoLoaded;

      final updatedTodos = currentState.todos.map((todo) {
        if (todo.id == event.id) {
          return TodoModel(
            id: todo.id,
            title: event.title,
            description: event.description,
            time: todo.time,
            isCompleted: todo.isCompleted,
          );
        }
        return todo;
      }).toList();

      await getIt<TodoRepository>().saveTodos(updatedTodos);
      emit(TodoLoaded(updatedTodos));
    }
  }
}
