import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/app_themes.dart';
import '../screen/search_home.dart';

// source github tham khao:
// https://github.com/rrafush/weather_app
// https://github.com/codestronaut/flutter-weather-app-sample
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        theme: AppThemes.appTheme,
        home: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Scaffold(
            body: SearchHome()
          ),
        ));
  }
}
