import 'dart:async';
import 'package:app/constants/constants.dart';
import 'package:sqflite/sqflite.dart';
import 'package:app/db_helper/database_connection.dart';

class DatabaseHelper{

  late DatabaseConnection _databaseConnection;

  DatabaseHelper() {
    _databaseConnection = DatabaseConnection();
  }
  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await _databaseConnection.init();
      return _database;
    }
  }

  static Database? _wordDB;
  Future<Database?> get wordDB async {
    if (_wordDB != null) {
      return _wordDB;
    } else {
      _wordDB = await _databaseConnection.setDatabase();
      return _wordDB;
    }
  }

  //SELECT * FROM Dictionary  WHERE  tu LIKE  "he%"
  getListWord(table, word) async {
    var connection = await database;
    // return await connection?.query(table, where: "tu LIKE ?", whereArgs: [word]);
    return await connection?.query(table, where: "tu LIKE ? LIMIT 10", whereArgs: ['$word%']);
  }

  //save word
  save(data) async {
    var connection = await wordDB;
    return await connection?.insert(Constants.TABLE_WORD, data);
    // var connection = await database;
    // return await connection?.insert(table, data);
  }

  //Read All Record
  getAll() async {
    var connection = await wordDB;
    return await connection?.query(Constants.TABLE_WORD);
  }

  //Read a Single Record By ID
  readDataById(table, itemId) async {
    var connection = await database;
    return await connection?.query(table, where: 'id=?', whereArgs: [itemId]);
  }

  //Update User
  updateData(table, data) async {
    var connection = await database;
    return await connection
        ?.update(table, data, where: 'id=?', whereArgs: [data['id']]);
  }

  //Delete User
  deleteDataById(table, itemId) async {
    var connection = await database;
    return await connection?.rawDelete("delete from $table where id=$itemId");
  }
}