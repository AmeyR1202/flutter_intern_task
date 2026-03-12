import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_intern_task/core/theme/app_colors.dart';
import 'package:flutter_intern_task/core/widgets/snackbar.dart';
import 'package:flutter_intern_task/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_intern_task/features/auth/presentation/bloc/auth_event.dart';
import 'package:flutter_intern_task/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_intern_task/features/auth/presentation/widgets/auth_button.dart';
import 'package:flutter_intern_task/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          snackbar(context, state.message);
        }

        if (state is AuthSuccess) {
          snackbar(context, 'Login Successful');
          context.go('/projects');
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome Back",
                  style: GoogleFonts.inter(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  "Login to Continue",
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textSecondary,
                  ),
                ),

                const SizedBox(height: 16),

                AuthTextField(controller: emailController, hintText: 'Email'),

                const SizedBox(height: 16),

                AuthTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 16),

                AuthButton(
                  text: 'Login',
                  onPressed: () {
                    context.read<AuthBloc>().add(
                      LoginRequested(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
