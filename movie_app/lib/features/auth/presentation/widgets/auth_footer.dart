import 'package:flutter/material.dart';
import 'package:movie_app/core/colors/app_colors.dart';

/// Bottom "Don't have an account? Sign Up" prompt.
class AuthFooter extends StatelessWidget {
  final String questionText;
  final String actionText;
  final VoidCallback? onAction;

  const AuthFooter({
    super.key,
    this.questionText = "Don't have an account?",
    this.actionText = 'Sign Up',
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$questionText ',
          style: const TextStyle(
            color: AppColors.textGrey,
            fontSize: 14,
          ),
        ),
        GestureDetector(
          onTap: onAction,
          child: Text(
            actionText,
            style: const TextStyle(
              color: AppColors.primaryPurpleLight,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
