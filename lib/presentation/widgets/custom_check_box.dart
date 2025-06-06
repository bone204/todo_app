import 'package:flutter/material.dart';
import 'package:todo_app/core/constants/app_colors.dart';

class CustomCheckbox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const CustomCheckbox({
    super.key, required this.value, required this.onChanged,
  });

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Transform.scale(
        scale: 1.5,
        child: Checkbox(
          value: widget.value,
          onChanged: widget.onChanged,
          checkColor: Colors.white,
          activeColor: AppColors.deepPurple,
          side: BorderSide(
            color: AppColors.deepPurple
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, 
          visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
        ),
      ),
    );
  }
}
