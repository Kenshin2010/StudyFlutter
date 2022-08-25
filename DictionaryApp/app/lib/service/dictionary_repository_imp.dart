import 'dart:io';
import 'package:app/service/dictionary_repository.dart';
import 'exception/exception.dart';
import 'package:app/model/dictionary.dart';
import 'exception/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:app/service/remote_data_source.dart';

class DictionaryRepositoryImpl implements DictionaryRepository {
  final RemoteDataSource remoteDataSource;

  DictionaryRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Dictionary>>> getListDictionary(String word) async {
    try {
      final result = await remoteDataSource.getListDictionary(word);
      return Right(result);
    } on DatabaseException {
      return Left(DatabaseFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
