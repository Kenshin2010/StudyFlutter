import 'dart:math';

import '../models/weather_data.dart';
import '../constants/temperature.dart';
import '../models/days.dart';

// source github tham khao:
// https://github.com/rrafush/weather_app
// https://github.com/codestronaut/flutter-weather-app-sample

class Urls {
  static const String baseUrl =
      'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services';
  // static const String baseUrl = 'https://api.openweathermap.org/data/2.5';
  // static const String apiKey = 'cc95d932d5a45d33a9527d5019475f2c';
  // static const String apiKey = '763a28dfe75b36c00c0d02362601425c';
  static const String apiKey = 'MJPD3E868YAVFJJDDFRSY585R';

  static String currentWeatherByName(String city) =>
      '$baseUrl/timeline/${city}?key=$apiKey';

  // static String weatherIcon(String iconCode) =>
  //     'http://openweathermap.org/img/wn/$iconCode@2x.png';
//http://api.openweathermap.org/data/2.5/weather?q=hanoi&appid=763a28dfe75b36c00c0d02362601425c&units=metric

//https://www.visualcrossing.com/resources/documentation/weather-api/timeline-weather-api/
//https://www.visualcrossing.com/resources/blog/replacing-the-google-weather-api/

//get timeline trong do co ngay hien tai
//  https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/hanoi?key=MJPD3E868YAVFJJDDFRSY585R
// get 3 ngay toi
//https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/ho%20chi%20minh/next3days?key=MJPD3E868YAVFJJDDFRSY585R
}

class Utils {
  static String convertFToC(double temp) {
    return '${Temperature(temp).fromftoc.ceil()}°C';
  }

  static String getAsset(dynamic item) {
    final String asset;
    String input = '';
    if (item is WeatherData) {
      input = item.currentConditions.icon;
    } else if (item is Days) {
      input = item.icon;
    }
    print('get icon by weather : $input');
    switch (input) {
      case 'snow':
        asset = 'assets/snow.png';
        break;
      case 'rain':
        asset = 'assets/heavy_rain.png';
        break;
      case 'fog':
        asset = 'assets/heavy_cloud.png';
        break;
      case 'wind':
        asset = 'assets/heavy_rain.png';
        break;
      case 'cloudy':
        asset = 'assets/heavy_cloud.png';
        break;
      case 'partly-cloudy-day':
        asset = 'assets/light_cloud.png';
        break;
      case 'partly-cloudy-night':
        asset = 'assets/showers.png';
        break;
      case 'clear-day':
        asset = 'assets/clear.png';
        break;
      case 'clear-night':
        asset = 'assets/clear_night.png';
        break;
      case 'clear':
        asset = 'assets/clear.png';
        break;
      default:
        asset = 'assets/light_cloud.png';
    }

    return asset;
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}
