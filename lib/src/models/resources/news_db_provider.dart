import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'dart:async';
import '../item_model.dart';
import 'repository.dart';

class NewsDbProvier implements Source,Cache {
  NewsDbProvider(){
    init();
  }

  late Database db;

  //Todo - Store and Fetch top ids.
  Future<List<int>>? fetchTopIds(){
    return null;
  }
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
  Future<int> addItem ( ItemModel? item){
    if (item != null){
    return db.insert("items", item.toMap());
    } else return Future.value(-1);
  }
}
final newsDbProvider = NewsDbProvier();