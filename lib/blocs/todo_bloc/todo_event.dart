abstract class TodoEvent {}

class LoadTodos extends TodoEvent {}

class AddTodo extends TodoEvent {
  final String title;
  final String description;

  AddTodo(this.title, this.description);
}

class CompleteTodo extends TodoEvent {
  final String id;

  CompleteTodo(this.id);
}

class DeleteTodo extends TodoEvent {
  final String id;

  DeleteTodo(this.id);
}
