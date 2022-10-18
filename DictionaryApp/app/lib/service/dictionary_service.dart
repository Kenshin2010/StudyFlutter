import 'dart:async';

import 'package:app/db_helper/database_helper.dart';
import 'package:app/constants/constants.dart';

class DictionaryService {
  late DatabaseHelper _databaseHelper;
  DictionaryService() {
    _databaseHelper = DatabaseHelper();
  }

  // get list word by word
  getListWord(String word) async{
    return await _databaseHelper.getListWord(Constants.TABLE_DICTIONARY, word);
  }
}
