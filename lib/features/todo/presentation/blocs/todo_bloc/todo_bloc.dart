import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/resources/data_state.dart';
import 'package:todo_app/features/todo/domain/usecases/get_todo.dart';
import 'package:todo_app/features/todo/presentation/blocs/todo_bloc/todo_event.dart';
import 'package:todo_app/features/todo/presentation/blocs/todo_bloc/todo_state.dart';
import 'package:todo_app/core/util/get_date_time_now.dart';
import 'package:uuid/uuid.dart';
import 'package:todo_app/features/todo/domain/entities/todo.dart';
import 'package:todo_app/features/todo/domain/usecases/add_todo.dart';
import 'package:todo_app/features/todo/domain/usecases/delete_todo.dart';
import 'package:todo_app/features/todo/domain/usecases/complete_todo.dart';
import 'package:todo_app/features/todo/domain/usecases/edit_todo.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final uuid = Uuid();
  final GetTodoUseCase _getTodoUseCase;
  final AddTodoUseCase _addTodoUseCase;
  final DeleteTodoUseCase _deleteTodoUseCase;
  final CompleteTodoUseCase _completeTodoUseCase;
  final EditTodoUseCase _editTodoUseCase;

  TodoBloc(this._getTodoUseCase, this._addTodoUseCase, this._deleteTodoUseCase, this._completeTodoUseCase, this._editTodoUseCase) : super(TodoLoading()) {
    on<LoadTodos>(_onLoadTodos);
    on<AddTodo>(_onAddTodo);
    on<DeleteTodo>(_onDeleteTodo);
    on<CompleteTodo>(_onCompleteTodo);
    on<EditTodo>(_onEditTodo);
  }

  Future<void> _onLoadTodos(LoadTodos event, Emitter<TodoState> emit) async {
    final dataState = await _getTodoUseCase();
    if (dataState is DataSuccess && dataState.data != null) {
      emit(TodoLoaded(dataState.data!));
    } else if (dataState is DataFailed) {
      emit(TodoError(dataState.error!));
    }
  }

  Future<void> _onAddTodo(AddTodo event, Emitter<TodoState> emit) async {
    if (state is TodoLoaded) {
      final todos = List<TodoEntity>.from((state as TodoLoaded).todos ?? [])
        ..add(TodoEntity(
          id: uuid.v4(),
          title: event.title,
          description: event.description,
          time: getDateTimeNow(),
          isCompleted: false,
        ));
      await _addTodoUseCase(params: todos.last);
      emit(TodoLoaded(todos));
    }
  }

  Future<void> _onCompleteTodo(CompleteTodo event, Emitter<TodoState> emit) async {
    if (state is TodoLoaded) {
      final currentState = state as TodoLoaded;
      final updatedTodos = (currentState.todos ?? []).map((todo) {
        if (todo.id == event.id) {
          return TodoEntity(
            id: todo.id,
            title: todo.title,
            description: todo.description,
            time: todo.time,
            isCompleted: !todo.isCompleted,
          );
        }
        return todo;
      }).toList();
      await _completeTodoUseCase(params: event.id);
      emit(TodoLoaded(updatedTodos));
    }
  }

  Future<void> _onDeleteTodo(DeleteTodo event, Emitter<TodoState> emit) async {
    if (state is TodoLoaded) {
      final todos = (state as TodoLoaded).todos?.where((todo) => todo.id != event.id).toList() ?? [];
      await _deleteTodoUseCase(params: event.id);
      emit(TodoLoaded(todos));
    }
  }

  Future<void> _onEditTodo(EditTodo event, Emitter<TodoState> emit) async {
    if (state is TodoLoaded) {
      final currentState = state as TodoLoaded;
      final updatedTodos = (currentState.todos ?? []).map((todo) {
        if (todo.id == event.id) {
          return TodoEntity(
            id: todo.id,
            title: event.title,
            description: event.description,
            time: todo.time,
            isCompleted: todo.isCompleted,
          );
        }
        return todo;
      }).toList();
      final edited = updatedTodos.firstWhere((todo) => todo.id == event.id);
      await _editTodoUseCase(params: edited);
      emit(TodoLoaded(updatedTodos));
    }
  }
}
