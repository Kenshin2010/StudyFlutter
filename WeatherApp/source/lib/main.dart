import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/app_themes.dart';
import '../screen/search_home.dart';
import 'injection.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/weather_bloc.dart';

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
          create: (_) => di.locator<WeatherBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        theme: AppThemes.appTheme,
          home: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: Scaffold(
                resizeToAvoidBottomInset: false,
                body: SearchHome()
            ),
          ))
    );
  }
}
