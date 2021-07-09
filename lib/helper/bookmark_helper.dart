import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../model/news.dart';

class BookmarkController {
  static final BookmarkController controller = BookmarkController._init();
  static Database _database;
  BookmarkController._init();
  static final BookmarkController instance = BookmarkController._init();

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDb();
  }

  Future<Database> initDb() async {
    final dir = await getApplicationDocumentsDirectory();
    final path = dir.path + "/bookmark.db";

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute("""
          CREATE TABLE bookmark(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
          url_image TEXT,
          url TEXT)""");
    });
  }

  Future<int> addBookmark(String title, urlImage, url) async {
    final db = await initDb();
    var maxIdResult =
        await db.rawQuery("SELECT MAX(id)+1 as last_inserted_id FROM bookmark");

    return db.insert(
      'bookmark',
      {
        'id': maxIdResult.first["last_inserted_id"],
        'title': title,
        'url_image': urlImage,
        'url': url,
      },
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  Future<List<SavedNews>> getBookmark() async {
    final db = await database;
    final maps = await db.query('bookmark');

    return List.generate(
      maps.length,
      (i) => SavedNews(
        maps[i]['id'],
        maps[i]['title'],
        maps[i]['url_image'],
        maps[i]['url'],
      ),
    );
  }

  Future<int> removeBookmark(int id) async {
    final db = await initDb();
    int result = await db.delete(
      'bookmark',
      where: "id = ?",
      whereArgs: [id],
    );

    return result;
  }
}
