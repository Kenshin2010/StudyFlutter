import 'dart:async';

import 'package:app/db_helper/database_helper.dart';
import 'package:app/model/dictionary.dart';

class DictionaryService {
  late DatabaseHelper _databaseHelper;
  DictionaryService() {
    _databaseHelper = DatabaseHelper();
  }
  // //Save User
  // SaveUser(Dictionary user) async {
  //   return await _repository.insertData('users', user.userMap());
  // }
  //
  // //Read All Users
  // readAllUsers() async {
  //   return await _repository.readData('users');
  // }
  //
  // //Edit User
  // UpdateUser(User user) async {
  //   return await _repository.updateData('users', user.userMap());
  // }
  //
  // deleteUser(userId) async {
  //   return await _repository.deleteDataById('users', userId);
  // }
}
