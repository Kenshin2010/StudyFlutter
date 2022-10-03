import 'dart:async';
import 'package:app/constants/constants.dart';
import 'package:sqflite/sqflite.dart';
import 'package:app/db_helper/database_connection.dart';
import 'package:app/model/word.dart';

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

  //SELECT * FROM Dictionary  WHERE  tu LIKE  "he%"
  getListWord(table, word) async {
    var connection = await database;
    // return await connection?.query(table, where: "tu LIKE ?", whereArgs: [word]);
    return await connection?.query(table, where: "tu LIKE ? LIMIT 10", whereArgs: ['$word%']);
  }

  //save word
  save(data, id) async {
    var connection = await database;
    return await connection?.update(
        Constants.TABLE_DICTIONARY,
        data,
        where: 'id = ?',
        whereArgs: [id]);
    // var connection = await database;
    // return await connection?.insert(table, data);
  }

  //Read All Record
  getAll() async {
    var connection = await database;
    return await connection?.query(Constants.TABLE_DICTIONARY, where: "isSaved LIKE ?", whereArgs: ['1']);
  }

  //Read a Single Record By ID
  getWordByID(itemId) async {
    var connection = await database;
    var res = await connection?.query(Constants.TABLE_DICTIONARY, where: 'id=?', whereArgs: [itemId]);
    if(res != null) {
      return res.isNotEmpty ? Word.fromMap(res.first) : null;
    } else {
      return null;
    }

  }
}