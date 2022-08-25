import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:typed_data';

class DatabaseConnection {

  Future<Database> init() async {
    var databasesPath = await getDatabasesPath();
    // copy db from asset -> device
    var path = join(databasesPath, "dictionary.db");
    var exists = await databaseExists(path);
    if (exists) {
      print("Opening existing database");
      return await openDatabase(path);
    } else {
      print("Creating new copy from asset");
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}
      ByteData data = await rootBundle.load(join("assets", "dictionary.db"));
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
    }
    return await openDatabase(path);
    // copy db from asset -> device
  }


}
