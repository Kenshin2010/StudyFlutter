import 'dart:convert';
import 'exception//exception.dart';
import 'package:app/model/dictionary.dart';
import 'package:app/db_helper/database_helper.dart';

abstract class RemoteDataSource {
  Future<List<Dictionary>> getListDictionary(String word);
}

class RemoteDataSourceImp implements RemoteDataSource {
  final DatabaseHelper databaseHelper;
  RemoteDataSourceImp({required this.databaseHelper});

  @override
  Future<List<Dictionary>> getListDictionary(String word) async {
    List<Dictionary> items = [];
    if(word.isEmpty){
      return items;
    }
    final data = await databaseHelper.getListWord('Dictionary', word);
    if (data != null) {
      data.forEach((result) {
        Dictionary dictionary = Dictionary.fromMap(result);
        items.add(dictionary);
      });
      return items;
    } else {
      throw DatabaseException();
    }
  }
}
