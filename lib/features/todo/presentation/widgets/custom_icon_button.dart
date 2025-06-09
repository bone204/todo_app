import 'package:flutter/material.dart';
import 'package:todo_app/core/constants/app_colors.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomIconButton({
    Key? key,
    required this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.black, size: 25),
        onPressed: onPressed,
      ),
    );
  }
}
