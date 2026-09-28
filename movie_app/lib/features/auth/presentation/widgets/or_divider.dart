import 'package:flutter/material.dart';
import 'package:movie_app/core/colors/app_colors.dart';

/// Horizontal "── or continue with ──" divider.
class OrDivider extends StatelessWidget {
  final String text;

  const OrDivider({super.key, this.text = 'or continue with'});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(color: AppColors.fieldBorder, thickness: 1),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            text,
            style: const TextStyle(
              color: AppColors.textGrey,
              fontSize: 12.5,
            ),
          ),
        ),
        const Expanded(
          child: Divider(color: AppColors.fieldBorder, thickness: 1),
        ),
      ],
    );
  }
}
