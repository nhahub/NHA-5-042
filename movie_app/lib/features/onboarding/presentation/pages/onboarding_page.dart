import 'package:flutter/material.dart';
import 'package:movie_app/core/colors/app_colors.dart';
import 'package:movie_app/core/widgets/primary_button.dart';
import 'package:movie_app/features/auth/presentation/pages/login_page.dart';
import 'package:movie_app/features/onboarding/presentation/widgets/onboarding_page_body.dart';

class OnboardingPage extends StatefulWidget {
  static const String routeName = '/onboarding';
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _pageController = PageController();
  int _currentIndex = 0;

  static const _pages = [
    (
      image: 'assets/images/Center Main Featured Card (Hero Focus).png',
      title: 'Discover Amazing\nMovies & TV Shows',
      subtitle: 'Explore thousands of movies and TV shows, all in one place.',
    ),
    (
      image: 'assets/images/Container.png',
      title: 'Track Your Favorites',
      subtitle: 'Add to watchlist, mark as watched, rate and more.',
    ),
    (
      image:
          "assets/images/Section - Illustrates the simulated in-app mobile device displaying 'My List.png",
      title: 'Your Personal\nMovie Library',
      subtitle: 'Keep track of what you want to watch and what you\'ve watched.',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToLogin() {
    Navigator.pushReplacementNamed(context, LoginPage.routeName);
  }

  void _handlePrimaryButton() {
    if (_currentIndex < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    } else {
      _goToLogin();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              // Skip
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: _goToLogin,
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      color: AppColors.textGrey,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              // Swipeable pages
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _pages.length,
                  onPageChanged: (index) =>
                      setState(() => _currentIndex = index),
                  itemBuilder: (context, index) {
                    final page = _pages[index];
                    return OnboardingPageBody(
                      imageAsset: page.image,
                      title: page.title,
                      subtitle: page.subtitle,
                      pageIndex: index,
                      pageCount: _pages.length,
                    );
                  },
                ),
              ),
              const SizedBox(height: 28),
              PrimaryButton(
                label: _currentIndex < _pages.length - 1
                    ? 'Next'
                    : 'Get Started',
                onPressed: _handlePrimaryButton,
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
