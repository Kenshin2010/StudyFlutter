import 'package:dartz/dartz.dart';
import 'exception/failure.dart';
import 'package:app/model/word.dart';

abstract class DictionaryRepository {
  Future<Either<Failure, List<Word>>> getListDictionary(String word);
  Future<Either<Failure, bool>> save(Word word);
  Future<Either<Failure, List<Word>>> getAllData();
}
