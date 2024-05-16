import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'dart:async';
import '../item_model.dart';
import 'repository.dart';

class NewsDbProvider implements Source, Cache {
  NewsDbProvider() {
    init();
  }

  late Future<Database> db;

  // Todo - Store and Fetch top ids.
  Future<List<int>>? fetchTopIds() {
    return null;
  }

  Future<void> init() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path, "items2.db");
    db =  openDatabase(
      path,
      version: 1,
      onCreate: (Database newDb, int version) {
        newDb.execute('''
          CREATE TABLE Items 
          (
            id INTEGER PRIMARY KEY,
            type TEXT,
            by TEXT,
            time INTEGER,
            text TEXT,
            parent INTEGER,
            kids BLOB,
            dead INTEGER,
            deleted INTEGER,
            url TEXT,
            score INTEGER,
            title TEXT,
            descendants INTEGER
          )
        ''');
      },
    );
  }

  Future<ItemModel?> fetchItem(int id) async {
    final Database database = await db;
    final maps = await database.query(
      "Items",
      columns: null,
      where: "id = ?",
      whereArgs: [id],
    );

    if (maps.length > 0) {
      return ItemModel.fromDb(maps.first);
    } else {
      return null;
    }
  }

  Future<int> addItem(ItemModel? item) async {
    if (item != null) {
      final Database database = await db;
      return database.insert("Items", item.toMap(),
       conflictAlgorithm : ConflictAlgorithm.ignore);
     
    } else {
      return Future.value(-1);
    }
}

Future<int> clear() async {
  final Database database = await db;
  return database.delete("Items");
}

}
final newsDbProvider = NewsDbProvider();