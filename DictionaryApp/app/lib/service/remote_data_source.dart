import 'dart:convert';
import 'package:app/constants/constants.dart';

import 'exception//exception.dart';
import 'package:app/model/word.dart';
import 'package:app/db_helper/database_helper.dart';

abstract class RemoteDataSource {
  Future<List<Word>> getListDictionary(String word);
  Future<bool> save(Word word);
  Future<List<Word>> getAll();
}

class RemoteDataSourceImp implements RemoteDataSource {
  final DatabaseHelper databaseHelper;
  RemoteDataSourceImp({required this.databaseHelper});

  @override
  Future<List<Word>> getListDictionary(String word) async {
    List<Word> items = [];
    if(word.isEmpty){
      return items;
    }
    final data = await databaseHelper.getListWord('Dictionary', word);
    if (data != null) {
      data.forEach((result) {
        Word dictionary = Word.fromMap(result);
        items.add(dictionary);
      });
      return items;
    } else {
      throw DatabaseException();
    }
  }

  @override
  Future<bool> save(Word word) async{
      int id = await databaseHelper.save(word.toMap());
      return true;
  }

  @override
  Future<List<Word>> getAll() async {
    List<Word> items = [];
    var data = await databaseHelper.getAll();
    if (data != null) {
      data.forEach((result) {
        Word dictionary = Word.fromMap2(result);
        items.add(dictionary);
      });
      return items;
    } else {
      throw DatabaseException();
    }
  }
}
