import 'package:flutter/material.dart';
import 'package:movie_app/core/colors/app_colors.dart';
import 'package:movie_app/core/widgets/custom_text_field.dart';
import 'package:movie_app/core/widgets/primary_button.dart';
import 'package:movie_app/features/auth/presentation/pages/login_page.dart';
import 'package:movie_app/features/auth/presentation/widgets/auth_footer.dart';
import 'package:movie_app/features/auth/presentation/widgets/auth_header.dart';
import 'package:movie_app/features/auth/presentation/widgets/auth_logo.dart';
import 'package:movie_app/features/auth/presentation/widgets/or_divider.dart';
import 'package:movie_app/features/auth/presentation/widgets/social_login_row.dart';

class SignInPage extends StatefulWidget {
  static const String routeName = '/signin';
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInState();
}

class _SignInState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleSignUp() {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState?.validate() ?? false) {
      // TODO: hook up real auth logic
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Account created successfully')),
      );
    }
  }

  void _goToLogin() {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    } else {
      Navigator.pushReplacementNamed(context, LoginPage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 28),
                        const Center(child: AuthLogo()),
                        const SizedBox(height: 32),
                        const AuthHeader(
                          title: 'Create Account',
                          subtitle: 'Join to start your journey',
                        ),
                        const SizedBox(height: 24),
                        CustomTextField(
                          controller: _nameController,
                          hintText: 'Full Name',
                          prefixIcon: Icons.person_outline_rounded,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter your full name';
                            }
                            if (value.trim().length < 3) {
                              return 'Name must be at least 3 characters';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 14),
                        CustomTextField(
                          controller: _emailController,
                          hintText: 'Email',
                          prefixIcon: Icons.email_outlined,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter your email';
                            }
                            final emailRegex = RegExp(
                              r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                            );
                            if (!emailRegex.hasMatch(value.trim())) {
                              return 'Enter a valid email address';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 14),
                        CustomTextField(
                          controller: _passwordController,
                          hintText: 'Password',
                          prefixIcon: Icons.lock_outline_rounded,
                          obscureText: _obscurePassword,
                          textInputAction: TextInputAction.done,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: AppColors.hintGrey,
                              size: 20,
                            ),
                            onPressed: () => setState(
                              () => _obscurePassword = !_obscurePassword,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        PrimaryButton(
                          label: 'Sign Up',
                          onPressed: _handleSignUp,
                        ),
                        const SizedBox(height: 24),
                        const OrDivider(),
                        const SizedBox(height: 20),
                        const SocialLoginRow(),
                        const Spacer(),
                        const SizedBox(height: 24),
                        AuthFooter(
                          questionText: 'Already have an account?',
                          actionText: 'Login',
                          onAction: _goToLogin,
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
