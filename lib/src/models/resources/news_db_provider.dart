import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'dart:async';
import '../item_model.dart';

class NewsDbProvier {
  late Database db;

  void init() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path, "items.db");
    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database newDb, int version) {
        newDb.execute('''
          Create TABLE Items 
          (
            id INTEGER PRIMARY KEY,
            type TEXT,
            by TEXT ,
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
  Future<ItemModel?> fetchItem(int id) async{
    final maps = await db.query(
      "Items",
      columns: null,
      where: "id = ?",
      whereArgs: [id],

    );

    if (maps.length > 0) {
      return ItemModel.fromDb( maps.first);
    } else {
      return null;
    }
  }
  Future<int> addItem(ItemModel item){
    return db.insert("items", item.toMap());
  }
}