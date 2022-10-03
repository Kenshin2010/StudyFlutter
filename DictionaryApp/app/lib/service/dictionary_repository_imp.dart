import 'dart:io';
import 'package:app/service/dictionary_repository.dart';
import 'exception/exception.dart';
import 'package:app/model/word.dart';
import 'exception/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:app/service/remote_data_source.dart';

class DictionaryRepositoryImpl implements DictionaryRepository {
  final RemoteDataSource remoteDataSource;

  DictionaryRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Word>>> getListDictionary(String word) async {
    try {
      final result = await remoteDataSource.getListDictionary(word);
      return Right(result);
    } on DatabaseException {
      return Left(DatabaseFailure(''));
    } /*on SocketException {
      return Left(ConnectionFailure(''));
    }*/
  }

  @override
  Future<Either<Failure, Word>> save(Word word) async{
    try{
      final result = await remoteDataSource.save(word);
      return Right(result);
    }on DatabaseException{
      return Left(DatabaseFailure(''));
    }/*on Exception catch(_){
      return Left(ConnectionFailure(''));
    }*/
  }

  @override
  Future<Either<Failure, List<Word>>> getAllData() async{
    try{
      final result = await remoteDataSource.getAll();
      return Right(result);
    }on DatabaseException{
      return Left(DatabaseFailure(''));
    }/*on Exception catch(_){
      return Left(ConnectionFailure(''));
    }*/
  }
}
