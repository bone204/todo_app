import 'package:flutter/material.dart';
import 'package:todo_app/core/constants/app_colors.dart';
import 'package:todo_app/core/constants/app_texts.dart';
import 'package:todo_app/core/utils/get_date_time_now.dart';
import 'package:todo_app/views/add_task/add_task_view.dart';
import 'package:todo_app/widgets/custom_button.dart';
import 'package:todo_app/widgets/task_bar.dart';

class HomeView extends StatelessWidget{
  HomeView({super.key});

  final List<String> tasks = [
    "Task 1",
    "Task 2",
    "Task 3",
  ];
  

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
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      return TaskBar(taskName: tasks[index], description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",);
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
                        builder: (context) => AddTaskView(),
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