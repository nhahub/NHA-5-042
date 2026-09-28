import 'package:flutter/material.dart';
import 'package:movie_app/core/colors/app_colors.dart';
import 'package:movie_app/features/onboarding/presentation/widgets/onboarding_dots.dart';

/// Single onboarding page body: Figma visual + centered title/subtitle + dots.
/// Reused for Discover / Track / Library pages.
class OnboardingPageBody extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String subtitle;
  final int pageIndex;
  final int pageCount;

  const OnboardingPageBody({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.subtitle,
    required this.pageIndex,
    required this.pageCount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Figma visual
        Expanded(
          child: Center(
            child: Image.asset(
              imageAsset,
              fit: BoxFit.contain,
            ),
          ),
        ),
        // Title
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppColors.textWhite,
            fontSize: 24,
            fontWeight: FontWeight.w800,
            height: 1.3,
          ),
        ),
        const SizedBox(height: 12),
        // Subtitle
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.textGrey,
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ),
        const SizedBox(height: 20),
        OnboardingDots(count: pageCount, currentIndex: pageIndex),
      ],
    );
  }
}
