import 'package:flutter/material.dart';
import 'package:todo_app/core/constants/app_colors.dart';
import 'package:todo_app/core/utils/get_date_time_now.dart';
import 'package:todo_app/widgets/custom_check_box.dart';

class TaskBar extends StatefulWidget {
  final String taskName;
  final String description;

  const TaskBar({super.key, required this.taskName, required this.description});

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
                  Text(widget.taskName, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.black)),
                  SizedBox(
                    width: 250,
                    child: Text(
                      widget.description, 
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
                  Text(getDateTimeNow(),style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color:AppColors.grey)),
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
                onPressed: () {}, 
                icon: Icon(Icons.delete, size: 30),
              ),
            ],
          ),
        ],
      ),
    );
  }
}