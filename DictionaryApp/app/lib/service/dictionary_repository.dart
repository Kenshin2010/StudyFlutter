import 'package:dartz/dartz.dart';
import 'exception/failure.dart';
import 'package:app/model/dictionary.dart';

abstract class DictionaryRepository {
  Future<Either<Failure, List<Dictionary>>> getListDictionary(String word);
}
