import 'package:todo_app/core/resources/data_state.dart';
import 'package:todo_app/core/usecase/usecase.dart';
import 'package:todo_app/features/todo/domain/entities/todo.dart';
import 'package:todo_app/features/todo/domain/repository/todo_repository.dart';

class GetTodoUseCase implements UseCase<DataState<List<TodoEntity>>, void>{
  final TodoRepository _todoRepository;


  GetTodoUseCase(this._todoRepository);
  
  @override
  Future<DataState<List<TodoEntity>>> call({void params}) {
    return _todoRepository.getTodos();
  }
}