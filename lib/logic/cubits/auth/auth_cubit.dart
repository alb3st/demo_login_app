import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repositories/auth_repository.dart';
import 'auth_state.dart';

/// Menjembatani UI (login_screen) dan data (AuthRepository).
/// Screen memanggil login() ini, tidak pernah memanggil repository langsung.
class AuthCubit extends Cubit<AuthState> {
  final AuthRepository repository;
  AuthCubit(this.repository) : super(AuthInitial());

  Future<void> login(String username, String password) async {
    emit(AuthLoading());
    final isValid = await repository.login(username, password);
    if (isValid) {
      emit(AuthSuccess());
    } else {
      emit(const AuthFailure('Username atau password salah.'));
    }
  }
}