abstract class TodoEvent {
  const TodoEvent();
}

class LoadTodos extends TodoEvent {
  const LoadTodos();
}

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

class EditTodo extends TodoEvent {
  final String id;
  final String title;
  final String description;

  EditTodo(this.id, this.title, this.description);
}
