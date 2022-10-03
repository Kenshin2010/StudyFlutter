import 'dart:convert';
import 'package:app/constants/constants.dart';

import 'exception//exception.dart';
import 'package:app/model/word.dart';
import 'package:app/db_helper/database_helper.dart';

abstract class RemoteDataSource {
  Future<List<Word>> getListDictionary(String word);
  Future<Word> save(Word word);
  Future<List<Word>> getAll();
}

class RemoteDataSourceImp implements RemoteDataSource {
  final DatabaseHelper databaseHelper;
  RemoteDataSourceImp({required this.databaseHelper});

  @override
  Future<List<Word>> getListDictionary(String word) async {
    List<Word> items = [];
    if (word.isEmpty) {
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
  Future<Word> save(Word word) async {
    Word data = await databaseHelper.getWordByID(word.id);
    if(data.isSaved == 1){
      word.isSaved = 0;
      await databaseHelper.save(word.toMap(), word.id);
    }else{
      word.isSaved = 1;
      await databaseHelper.save(word.toMap(), word.id);
    }
    return await databaseHelper.getWordByID(word.id);
  }

  @override
  Future<List<Word>> getAll() async {
    List<Word> items = [];
    var data = await databaseHelper.getAll();
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
}
