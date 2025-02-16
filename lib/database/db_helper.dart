import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'app_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE items (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT)',
        );
      },
    );
  }

  Future<int> insertItem(String name) async {
    final db = await database;
    return await db.insert('items', {'name': name});
  }

  Future<List<Map<String, dynamic>>> getItems() async {
    final db = await database;
    return await db.query('items');
  }

  Future<int> updateItem(int id, String name) async {
    final db = await database;
    return await db.update('items', {'name': name}, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteItem(int id) async {
    final db = await database;
    return await db.delete('items', where: 'id = ?', whereArgs: [id]);
  }
}