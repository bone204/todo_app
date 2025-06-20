import 'package:todo_app/core/usecase/usecase.dart';
import 'package:todo_app/features/todo/domain/entities/todo.dart';
import 'package:todo_app/features/todo/domain/repository/todo_repository.dart';

class EditTodoUseCase implements UseCase<void, TodoEntity> {
  final TodoRepository _todoRepository;

  EditTodoUseCase(this._todoRepository);

  @override
  Future<void> call({TodoEntity? params}) {
    return _todoRepository.editTodo(params!);
  }
} 