import 'package:flutter/material.dart';
import 'package:app/theme/app_themes.dart';
import 'package:app/screen/splash/splash_screen.dart';
import 'package:flutter/services.dart';
import 'injection.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/bloc/dictionary_bloc.dart';

// App tham khao: https://github.com/KathirvelChandrasekaran/dictionary_app
// Link tham khao cho db: https://viblo.asia/p/flutter-sqlite-database-4dbZN1rkKYM
void main() {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => di.locator<DictionaryBloc>(),
          ),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Weather App',
            theme: AppThemes.appTheme,
            home: const AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: Scaffold(
                  resizeToAvoidBottomInset: false, body: SplashScreen()),
            )));
  }
}
