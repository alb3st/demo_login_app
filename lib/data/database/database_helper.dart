import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../../core/constants/app_constants.dart';

/// Mengelola satu koneksi database SQLite (pola singleton) khusus untuk
/// demo login: membuat tabel `users` dan menyediakan fungsi validasi login.
class DatabaseHelper {
  DatabaseHelper._internal();
  static final DatabaseHelper instance = DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'demo_login.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username TEXT UNIQUE NOT NULL,
            password TEXT NOT NULL
          )
        ''');

        // Seed satu user demo agar bisa langsung dicoba login.
        await db.insert('users', {
          'username': AppConstants.demoUsername,
          'password': AppConstants.demoPassword,
        });
      },
    );
  }

  /// Mengembalikan true jika kombinasi username & password cocok
  /// dengan salah satu baris pada tabel users.
  Future<bool> validateLogin(String username, String password) async {
    final db = await database;
    final result = await db.query(
      'users',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );
    return result.isNotEmpty;
  }
}