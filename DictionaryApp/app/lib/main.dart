import 'package:flutter/material.dart';
import 'package:app/theme/app_themes.dart';
import 'package:app/screen/splash/splash_screen.dart';
import 'package:flutter/services.dart';

// App tham khao: https://github.com/KathirvelChandrasekaran/dictionary_app
// Link tham khao cho db: https://viblo.asia/p/flutter-sqlite-database-4dbZN1rkKYM
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
