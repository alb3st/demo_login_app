import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/theme/app_theme.dart';
import 'data/repositories/auth_repository_impl.dart';
import 'logic/cubits/auth/auth_cubit.dart';
import 'presentation/screens/login_screen.dart';

void main() {
  runApp(const DemoLoginApp());
}

class DemoLoginApp extends StatelessWidget {
  const DemoLoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(AuthRepositoryImpl()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Demo Login + SQLite',
        theme: AppTheme.lightTheme,
        home: const LoginScreen(),
      ),
    );
  }
}