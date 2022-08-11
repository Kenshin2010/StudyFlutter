import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:source_app/action/get_current_weather.dart';
import 'weather_event.dart';
import 'weather_state.dart';
import 'package:rxdart/rxdart.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetCurrentWeather _getCurrentWeather;

  WeatherBloc(this._getCurrentWeather) : super(WeatherEmpty()) {
    on<OnCityChanged>(
      (event, emit) async {
        final cityName = event.cityName;

        emit(WeatherLoading());

        final result = await _getCurrentWeather.execute(cityName);
        result.fold(
          (failure) {
            emit(WeatherError(failure.message));
          },
          (data) {
            emit(WeatherHasData(data));
          },
        );
      },
      transformer: delay(const Duration(milliseconds: 500)),
    );
  }

  EventTransformer<T> delay<T>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }
}
