import 'package:dartz/dartz.dart';
import 'exception/failure.dart';
import '../models/weather_data.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherData>> getCurrentWeather(String cityName);
}
