import 'package:app/service/dictionary_repository.dart';
import 'package:app/model/word.dart';
import 'package:dartz/dartz.dart';
import 'package:app/service/exception/failure.dart';

class DictionaryManager{

  final DictionaryRepository repository;

  DictionaryManager(this.repository);

  Future<Either<Failure, List<Word>>> execute(String word) {
    return repository.getListDictionary(word);
  }

  Future<Either<Failure, bool>> save(Word word) {
    return repository.save(word);
  }

  Future<Either<Failure, List<Word>>> getAll() {
    return repository.getAllData();
  }

}