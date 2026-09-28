import 'package:flutter/material.dart';
import 'package:movie_app/core/colors/app_colors.dart';

/// Top brand mark: small app icon + "MovieVerse" wordmark.
/// Reusable on login / sign-up / splash-adjacent auth screens.
class AuthLogo extends StatelessWidget {
  final double iconSize;
  final double fontSize;

  const AuthLogo({super.key, this.iconSize = 56, this.fontSize = 22});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: iconSize,
          height: iconSize,
          decoration: BoxDecoration(
            color: const Color(0xFF1B1430),
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryPurple.withValues(alpha: 0.45),
                blurRadius: 28,
                spreadRadius: 2,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset(
              'assets/logos/Logo Container with Neon Glow Backplate_margin.png',
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => const Icon(
                Icons.play_circle_fill_rounded,
                color: AppColors.primaryPurpleLight,
                size: 36,
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Image.asset(
          "assets/icons/Heading 1 - App Title_margin.png",
          width: 107,
          height: 30,
        ),
      ],
    );
  }
}
