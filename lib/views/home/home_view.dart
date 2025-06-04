import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/blocs/todo_bloc/todo_bloc.dart';
import 'package:todo_app/blocs/todo_bloc/todo_state.dart';
import 'package:todo_app/core/constants/app_colors.dart';
import 'package:todo_app/core/constants/app_texts.dart';
import 'package:todo_app/core/utils/get_date_time_now.dart';
import 'package:todo_app/views/add_task/add_task_view.dart';
import 'package:todo_app/widgets/custom_button.dart';
import 'package:todo_app/widgets/task_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                height: 240,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.deepPurple,
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Text(getDateTimeNow(), style: TextStyle(fontSize: 20, color: AppColors.white, fontWeight: FontWeight.w600)),
                      SizedBox(height: 40),
                      Text(AppText.textMyTodoList.text, style: TextStyle(fontSize: 30, color: AppColors.white, fontWeight: FontWeight.w900)),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 160,
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: BlocBuilder<TodoBloc, TodoState>(
                    builder: (context, state) {
                      if (state is TodoLoaded) {
                        if(state.todos.isEmpty) {
                          return Container();
                        }
                        
                        final incompleteTodos = state.todos.where((todo) => !todo.isCompleted).toList();
                        final completedTodos = state.todos.where((todo) => todo.isCompleted).toList();

                        return ListView(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          children: [
                            if (incompleteTodos.isNotEmpty) ...[
                              Text(
                                'Tasks',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.deepPurple,
                                ),
                              ),
                              SizedBox(height: 16),
                              ...incompleteTodos.map((todo) => TaskBar(todo: todo)),
                            ],
                            if (completedTodos.isNotEmpty) ...[
                              SizedBox(height: 24),
                              Text(
                                'Completed',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.black,
                                ),
                              ),
                              SizedBox(height: 16),
                              ...completedTodos.map((todo) => TaskBar(todo: todo)),
                            ],
                          ],
                        );
                      }
                      return Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 30,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomButton(text: AppText.textAddNewTask.text, onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddTaskView(
                          todoBloc: context.read<TodoBloc>(),
                        ),
                      ),
                    );
                  }),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}