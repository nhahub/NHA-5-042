import 'package:flutter/material.dart';
import 'package:movie_app/core/colors/app_colors.dart';

/// Right-aligned "Forgot password?" link.
class ForgotPasswordButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const ForgotPasswordButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: onPressed ?? () {},
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 4),
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: const Text(
          'Forgot password?',
          style: TextStyle(color: AppColors.textGrey, fontSize: 13),
        ),
      ),
    );
  }
}
