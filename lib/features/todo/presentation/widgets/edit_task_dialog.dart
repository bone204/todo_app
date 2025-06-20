import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/todo/domain/entities/todo.dart';
import 'package:todo_app/features/todo/presentation/blocs/todo_bloc/todo_bloc.dart';
import 'package:todo_app/features/todo/presentation/blocs/todo_bloc/todo_event.dart';
import 'package:todo_app/features/todo/presentation/widgets/custom_textfield.dart';

class EditTaskDialog extends StatefulWidget {
  final TodoEntity todo;

  const EditTaskDialog({super.key, required this.todo});

  @override
  State<EditTaskDialog> createState() => _EditTaskDialogState();
}

class _EditTaskDialogState extends State<EditTaskDialog> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.todo.title;
    _descriptionController.text = widget.todo.description;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  String? _validateTitle(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Title cannot be empty';
    }
    return null;
  }

  String? _validateDescription(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Description cannot be empty';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.todo.isCompleted) {
      return AlertDialog(
        title: Text('Task Completed'),
        content: Text('The task has been successfully completed.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      );
    }

    return AlertDialog(
      title: Text('Edit Task'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextfield(
              title: 'Title',
              controller: _titleController,
              hintText: 'Task Title',
              validator: _validateTitle,
            ),
            SizedBox(height: 16),
            CustomTextfield(
              title: 'Description',
              controller: _descriptionController,
              hintText: 'Task Description',
              validator: _validateDescription,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              final title = _titleController.text.trim();
              final desc = _descriptionController.text.trim();

              context.read<TodoBloc>().add(EditTodo(widget.todo.id, title, desc));
              Navigator.of(context).pop();
            }
          },
          child: Text('Save'),
        ),
      ],
    );
  }
} 