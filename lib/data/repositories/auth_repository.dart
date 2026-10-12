/// Kontrak (interface) untuk operasi autentikasi.
/// AuthCubit hanya bergantung pada ini — tidak tahu (dan tidak peduli)
/// apakah datanya dari SQLite, API, atau sumber lain.
abstract class AuthRepository {
  Future<bool> login(String username, String password);
}