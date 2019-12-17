import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

//helper class
class DBHelper {
  static Future<Database> database() async {
     //creating our database path
    //dbpath is the folder we would store the database
    final dbPath = await sql.getDatabasesPath();

    return sql.openDatabase(path.join(dbPath, 'places.db'),
     //oncreate is a function that tries to execute when there is not database
       
      
        onCreate: (db, version) {
          //run a sql query against the database
      return db.execute(
          'CREATE TABLE user_places(id Text PRIMARY KEY,title TEXT, image TEXT)');
    }, version: 1);
    
  }

   static Future<void> insert(String table, Map<String, Object> data) async {
  final db =await DBHelper.database();
  //insert in the database
    db.insert(
      table, 
      data,
        conflictAlgorithm: ConflictAlgorithm.replace);
   }

  // static Future<void> insert(String table, Map<String, Object> data) async {
   
  //   final dbPath = await sql.getDatabasesPath();
  //   //open the database
  //   //places.db is the name of our database
  //   final sqlDb = await sql.openDatabase(path.join(dbPath, 'places.db'),
  //       //oncreate is a function that tries to execute when there is not database
  //       onCreate: (db, version) {
  //     //run a sql query against the database
  //     return db.execute(
  //         'CREATE TABLE user_places(id Text PRIMARY KEY,title TEXT, image TEXT)');
  //   }, version: 1);
  //   await sqlDb.insert(table, data,
  //       conflictAlgorithm: ConflictAlgorithm.replace);
  // }

  //storing and fetching data
  static Future<List<Map<String, dynamic>>> getData(String table) async{
    final db = await DBHelper.database();
    //query the database
   return db.query(table);
  }
}
