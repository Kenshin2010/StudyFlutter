import 'package:app/service/dictionary_repository.dart';
import 'package:app/model/dictionary.dart';
import 'package:dartz/dartz.dart';
import '../service/exception/failure.dart';

class GetListWord{

  final DictionaryRepository repository;

  GetListWord(this.repository);

  Future<Either<Failure, List<Dictionary>>> execute(String word) {
    return repository.getListDictionary(word);
  }

}