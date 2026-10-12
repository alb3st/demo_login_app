import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/colors.dart';
import '../../core/theme/app_theme.dart';
import '../../logic/cubits/auth/auth_cubit.dart';
import '../../logic/cubits/auth/auth_state.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Login berhasil!')),
                  );
                }
              },
              builder: (context, state) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      AppConstants.appName,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    CustomCard(
                      child: Column(
                        children: [
                          CustomTextField(
                            label: 'Username',
                            controller: _usernameController,
                          ),
                          const SizedBox(height: AppSpacing.md),
                          CustomTextField(
                            label: 'Password',
                            controller: _passwordController,
                            obscureText: true,
                          ),
                          if (state is AuthFailure) ...[
                            const SizedBox(height: AppSpacing.sm),
                            Text(
                              state.message,
                              style: const TextStyle(color: AppColors.error, fontSize: 13),
                            ),
                          ],
                          const SizedBox(height: AppSpacing.lg),
                          CustomButton(
                            label: 'Masuk',
                            isLoading: state is AuthLoading,
                            onPressed: () => context.read<AuthCubit>().login(
                                  _usernameController.text.trim(),
                                  _passwordController.text.trim(),
                                ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Text(
                      'Coba login dengan: ${AppConstants.demoUsername} / ${AppConstants.demoPassword}',
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}