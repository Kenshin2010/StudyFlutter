import 'dart:io';

import '../service/remote_data_source.dart';
import 'exception/exception.dart';
import '../models/weather_data.dart';
import 'exception/failure.dart';
import 'package:dartz/dartz.dart';
import '../service/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final RemoteDataSource remoteDataSource;

  WeatherRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, WeatherData>> getCurrentWeather(
      String cityName) async {
    try {
      final result = await remoteDataSource.getCurrentWeather(cityName);
      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
