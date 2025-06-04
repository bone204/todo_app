import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/blocs/todo_bloc/todo_bloc.dart';
import 'package:todo_app/blocs/todo_bloc/todo_event.dart';
import 'package:todo_app/core/constants/app_colors.dart';
import 'package:todo_app/data/todo_model.dart';
import 'package:todo_app/widgets/custom_check_box.dart';

class TaskBar extends StatefulWidget {
  final TodoModel todo;

  const TaskBar({super.key, required this.todo});

  @override
  State<TaskBar> createState() => _TaskBarState();
}

class _TaskBarState extends State<TaskBar> {
  bool _isCheckboxChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.grey,
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.lightPurple,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.calendar_month,
                  color: AppColors.deepPurple,
                  size: 24,
                ),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.todo.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.black)),
                  SizedBox(
                    width: 250,
                    child: Text(
                      widget.todo.description, 
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 16, 
                        fontWeight: FontWeight.w400, 
                        color:AppColors.black
                      )
                    )
                  ),
                  SizedBox(height: 4),
                  Text(widget.todo.time,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color:AppColors.grey)),
                ],
              )
            ]
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomCheckbox(
                value: _isCheckboxChecked,
                onChanged: (bool? newValue) {
                  setState(() {
                    _isCheckboxChecked = newValue ?? false;
                  });
                },
              ),
              IconButton(
                onPressed: () {
                  context.read<TodoBloc>().add(DeleteTodo(widget.todo.id));
                }, 
                icon: Icon(Icons.delete, size: 30),
              ),
            ],
          ),
        ],
      ),
    );
  }
}