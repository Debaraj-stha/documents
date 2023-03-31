import 'package:flutter_all/model/a.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

class dbController {
  static Database? database;

  Future<Database?> get db async {
    if (database != null) {
      return database;
    }
    database = await initDatabase();
    return database;
  }

  Future<Database> initDatabase() async {
    io.Directory documentsDirectory =
        await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.toString(), "mainDb.db");
    var db = await openDatabase(
      path,
      version: 1,
      onCreate:_onCreate,
    );
    return db;
  }

  void _onCreate(Database db, int version) async {
    String sql =
        "CREATE TABLE a (id INTEGER PRIMARY KEY Autoincrement NOT NULL,name Text,address TEXT)";
    await db.execute(sql);
  }

  Future<a> insert(a model) async {
    var dbClient = await db;
    try {
      await dbClient!.insert("a", model.toJson());
    } catch (e) {
      print(e.toString());
    }
    return model;
  }

  Future<List<a>> getData() async {
    var dbClient = await db;
    if (dbClient == null) {
      return [];
    }
    final List<Map<String, Object?>> result = await dbClient.query("a");
    return result.map((e) => a.fromJson(e)).toList();
  }

  Future<int> deleteData(int id) async {
    var dbClient = await db;
    return dbClient!.delete("a", where: 'id=?', whereArgs: [id]);
  }

  Future updateData(int id, a model) async {
    var dbClient = await db;
    dbClient?.update("a", model.toJson(), where: 'id=?', whereArgs: [id]);
  }
  void print(String s){
    print(s);
  }
}
