// import 'dart:core';

// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
// import 'dart:io' as io;
// import 'package:path/path.dart';

// import '../model/a.dart';
// class helper{
// static Database? database;
// Future<Database?> get db async{
//   if(database!=null){
//     return database;
//   }
//   database=await initDatabase();
//   return database;
// }
// initDatabase() async{
//   io.Directory appDirectonary=await getApplicationDocumentsDirectory();
//   String path=join(appDirectonary.toString(),"db.db");
//   var db=openDatabase(path,onCreate: _onCreate,version: 1);
// }
// _onCreate(Database db,int version)async{
//   String sql="Creata ";
//   await database?.execute(sql);
// }
// Future<a> insert(a model)async{
//   var dbInstance=await db;
//   dbInstance?.insert("table",model.toJson());
//   return model;
// }
// Future<<List<a>> getData() async{
//   var dbInstance=await db;
//   if(dbInstance==null){
//     return [];
//   }
//   final List<Map<String,Object?>> item=await dbInstance.query("table");
//   return item.map((e)=>a.fromJson(e)).toList();
// }
// }