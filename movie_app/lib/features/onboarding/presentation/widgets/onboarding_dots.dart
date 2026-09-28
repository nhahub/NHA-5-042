import 'package:flutter/material.dart';
import 'package:movie_app/core/colors/app_colors.dart';

/// Page indicator dots: active page is an elongated purple pill,
/// inactive pages are small grey circles.
class OnboardingDots extends StatelessWidget {
  final int count;
  final int currentIndex;

  const OnboardingDots({
    super.key,
    required this.count,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        final isActive = index == currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 24 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: isActive
                ? AppColors.primaryPurple
                : AppColors.fieldBorder,
            borderRadius: BorderRadius.circular(8),
          ),
        );
      }),
    );
  }
}
