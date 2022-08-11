import 'dart:convert';

import '../constants/constants.dart';
import 'exception//exception.dart';
import '../models/weather_data.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future<WeatherData> getCurrentWeather(String cityName);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;
  RemoteDataSourceImpl({required this.client});

  @override
  Future<WeatherData> getCurrentWeather(String cityName) async {
    final response =
        await client.get(Uri.parse(Urls.currentWeatherByName(cityName)));
    print('Get path url: ${response.request}');
    if (response.statusCode == 200) {
      return WeatherData.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
