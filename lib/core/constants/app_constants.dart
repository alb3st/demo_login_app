/// Konstanta identitas aplikasi & kredensial demo.
/// Dipakai di berbagai layar agar tidak ada string yang di-hardcode berulang.
class AppConstants {
  AppConstants._();

  static const String appName = 'Demo Login + SQLite';
  static const String appVersion = '1.0.0';

  // Kredensial demo yang di-seed otomatis ke database saat pertama kali dibuat.
  // Pada aplikasi utama (Fase 5), password akan di-hash dulu (lihat password_helper.dart)
  // sebelum disimpan — di demo ini sengaja dibiarkan sederhana agar fokus pada pola SQLite.
  static const String demoUsername = 'admin';
  static const String demoPassword = 'admin123';
}