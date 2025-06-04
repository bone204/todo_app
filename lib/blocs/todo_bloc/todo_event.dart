abstract class TodoEvent {}

class LoadTodos extends TodoEvent {}

class AddTodo extends TodoEvent {
  final String title;
  final String description;

  AddTodo(this.title, this.description);
}

// class ToggleTodo extends TodoEvent {
//   final String id;

//   ToggleTodo(this.id);
// }

class DeleteTodo extends TodoEvent {
  final String id;

  DeleteTodo(this.id);
}
