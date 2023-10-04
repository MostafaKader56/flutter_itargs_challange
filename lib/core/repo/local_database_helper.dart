import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

class LocalDatabaseHelper {
  static late Database _database;

  static Future<void> initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final pathToDatabase = path.join(databasesPath, 'Favorites.db');

    _database = await openDatabase(
      pathToDatabase,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE Favorites (id INTEGER PRIMARY KEY, name_en TEXT, name_ar TEXT, is_favorite INTEGER)',
        );

        // Insert initial Favorites and more items can be added
        await db.rawInsert(
          'INSERT INTO Favorites(name_en, name_ar, is_favorite) VALUES (?, ?, ?)',
          ['Item 1', 'العنصر 1', 0],
        );
        await db.rawInsert(
          'INSERT INTO Favorites(name_en, name_ar, is_favorite) VALUES (?, ?, ?)',
          ['Item 2', 'العنصر 2', 0],
        );
        await db.rawInsert(
          'INSERT INTO Favorites(name_en, name_ar, is_favorite) VALUES (?, ?, ?)',
          ['Item 3', 'العنصر 3', 0],
        );
      },
    );
  }

  static Future<void> toggleFavorite(int id, bool isFavorite) async {
    await _database.rawUpdate(
      'UPDATE Favorites SET is_favorite = ? WHERE id = ?',
      [isFavorite ? 1 : 0, id],
    );
  }

  static Future<List<Map<String, dynamic>>> getFavorites() async {
    List<Map<String, Object?>> output = await _database.query('Favorites');

    return output;
  }
}
