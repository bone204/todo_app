import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/constants/app_colors.dart';
import 'package:todo_app/core/constants/app_texts.dart';
import 'package:todo_app/widgets/custom_button.dart';
import 'package:todo_app/widgets/custom_icon_button.dart';
import 'package:todo_app/widgets/custom_text_field.dart';
import 'package:todo_app/widgets/custom_text_form_field.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? _validateTitle(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter task title';
    }
    return null;
  }

  String? _validateDescription(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter task description';
    }
    return null;
  }

  void _handleSave() {
    if (_formKey.currentState!.validate()) {
      if (kDebugMode) {
        print('Title: ${_titleController.text}');
      }
      if (kDebugMode) {
        print('Description: ${_descriptionController.text}');
      }
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.deepPurple,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomIconButton(icon: Icons.chevron_left, onPressed: () => Navigator.pop(context)),
                                    Text(AppText.textAddNewTask.text, style: TextStyle(fontSize: 20, color: AppColors.white, fontWeight: FontWeight.w600)),
                                    SizedBox(width: 56, height: 56),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          CustomTextfield(
                            title: AppText.textTaskTile.text, 
                            hintText: AppText.textTaskTile.text,
                            controller: _titleController,
                            validator: _validateTitle,
                          ),
                          SizedBox(height: 20),
                          CustomTextFormfield(
                            title: AppText.textDescription.text, 
                            hintText: AppText.textDescription.text,
                            controller: _descriptionController,
                            validator: _validateDescription,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),   
              Positioned(
                left: 0,
                right: 0,
                bottom: 30,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomButton(text: AppText.textSave.text, onPressed: _handleSave),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}