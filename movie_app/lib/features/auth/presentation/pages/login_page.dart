import 'package:flutter/material.dart';
import 'package:movie_app/core/colors/app_colors.dart';
import 'package:movie_app/features/auth/presentation/pages/signup_page.dart';
import 'package:movie_app/features/auth/presentation/widgets/auth_footer.dart';
import 'package:movie_app/features/auth/presentation/widgets/auth_header.dart';
import 'package:movie_app/features/auth/presentation/widgets/auth_logo.dart';
import 'package:movie_app/core/widgets/custom_text_field.dart';
import 'package:movie_app/features/auth/presentation/widgets/forgot_password_button.dart';
import 'package:movie_app/core/widgets/primary_button.dart';
import 'package:movie_app/features/auth/presentation/widgets/or_divider.dart';
import 'package:movie_app/features/auth/presentation/widgets/social_login_row.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState?.validate() ?? false) {
      // TODO: hook up real auth logic
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Logged in successfully')),
      );
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
                          title: 'Welcome Back',
                          subtitle: 'Sign in to continue',
                        ),
                        const SizedBox(height: 24),
                        CustomTextField(
                          controller: _emailController,
                          hintText: 'Email or username',
                          prefixIcon: Icons.alternate_email_rounded,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter your email or username';
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
                        const SizedBox(height: 8),
                        const ForgotPasswordButton(),
                        const SizedBox(height: 16),
                        PrimaryButton(
                          label: 'Login',
                          onPressed: _handleLogin,
                        ),
                        const SizedBox(height: 24),
                        const OrDivider(),
                        const SizedBox(height: 20),
                        const SocialLoginRow(),
                        const Spacer(),
                        const SizedBox(height: 24),
                        AuthFooter(
                          onAction: () => Navigator.pushNamed(
                            context,
                            SignUpPage.routeName,
                          ),
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
