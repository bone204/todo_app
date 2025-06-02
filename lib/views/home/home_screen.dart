import 'package:flutter/material.dart';
import 'package:todo_app/core/constants/app_texts.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(AppText.textHello.text),
    );
  }
}