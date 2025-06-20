import 'package:todo_app/core/usecase/usecase.dart';
import 'package:todo_app/features/todo/domain/repository/todo_repository.dart';

class DeleteTodoUseCase implements UseCase<void, String> {
  final TodoRepository _todoRepository;

  DeleteTodoUseCase(this._todoRepository);

  @override
  Future<void> call({String? params}) {
    return _todoRepository.deleteTodo(params!);
  }
} 