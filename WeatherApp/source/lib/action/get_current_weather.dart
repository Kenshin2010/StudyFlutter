import 'package:dartz/dartz.dart';
import '../service/exception/failure.dart';
import '../models/weather_data.dart';
import '../service/weather_repository.dart';

class GetCurrentWeather {

  final WeatherRepository repository;

  GetCurrentWeather(this.repository);

  Future<Either<Failure, WeatherData>> execute(String cityName) {
    return repository.getCurrentWeather(cityName);
  }
}
