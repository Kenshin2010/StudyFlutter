import 'package:flutter/material.dart';
import 'package:app/theme/app_themes.dart';
import 'package:app/screen/splash/splash_screen.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        theme: AppThemes.appTheme,
        home: const AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Scaffold(resizeToAvoidBottomInset: false, body: SplashScreen()),
        ));
  }
}
