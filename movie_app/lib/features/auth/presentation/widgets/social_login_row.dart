import 'package:flutter/material.dart';
import 'package:movie_app/core/colors/app_colors.dart';

/// Single 56px circular outlined social button (Google / Facebook / Apple).
class CircleSocialButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;

  const CircleSocialButton({
    super.key,
    required this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent,
          border: Border.all(color: AppColors.fieldBorder, width: 1.2),
        ),
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}

/// Row of 3 circular providers centered on screen.
/// Icons are drawn with built-in widgets so no extra assets/packages needed.
class SocialLoginRow extends StatelessWidget {
  final VoidCallback? onGoogle;
  final VoidCallback? onFacebook;
  final VoidCallback? onApple;

  const SocialLoginRow({
    super.key,
    this.onGoogle,
    this.onFacebook,
    this.onApple,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleSocialButton(
          onTap: onGoogle,
          child: const Text(
            'G',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 16),
        CircleSocialButton(
          onTap: onFacebook,
          child: Container(
            width: 24,
            height: 24,
            decoration: const BoxDecoration(
              color: Color(0xFF1877F2),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: const Text(
              'f',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w800,
                height: 1.0,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        CircleSocialButton(
          onTap: onApple,
          child: const Icon(Icons.apple, color: Colors.white, size: 26),
        ),
      ],
    );
  }
}
