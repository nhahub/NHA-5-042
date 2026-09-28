import 'package:flutter/material.dart';
import 'package:movie_app/core/colors/app_colors.dart';

/// Left-aligned "Welcome Back / Sign in to continue" block.
/// Reusable with custom [title] / [subtitle].
class AuthHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final TextAlign align;

  const AuthHeader({
    super.key,
    this.title = 'Welcome Back',
    this.subtitle = 'Sign in to continue',
    this.align = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: align == TextAlign.left
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        Text(
          title,
          textAlign: align,
          style: const TextStyle(
            color: AppColors.textWhite,
            fontSize: 28,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.3,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          subtitle,
          textAlign: align,
          style: const TextStyle(
            color: AppColors.textGrey,
            fontSize: 14,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}
