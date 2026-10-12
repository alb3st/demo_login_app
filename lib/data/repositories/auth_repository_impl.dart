import '../database/database_helper.dart';
import 'auth_repository.dart';

/// Implementasi asli AuthRepository — membungkus DatabaseHelper yang
/// sebelumnya dipanggil langsung dari login_screen.dart.
class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<bool> login(String username, String password) {
    return DatabaseHelper.instance.validateLogin(username, password);
  }
}