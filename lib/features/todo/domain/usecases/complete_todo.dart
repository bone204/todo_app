import 'package:todo_app/core/usecase/usecase.dart';
import 'package:todo_app/features/todo/domain/repository/todo_repository.dart';

class CompleteTodoUseCase implements UseCase<void, String> {
  final TodoRepository _todoRepository;

  CompleteTodoUseCase(this._todoRepository);

  @override
  Future<void> call({String? params}) {
    return _todoRepository.completeTodo(params!);
  }
} 