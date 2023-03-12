import 'package:bloc/bloc.dart';
import 'package:cleanapp/src/domain/usecases/get_current_weather_usecase.dart';
import 'package:cleanapp/src/presentation/bloc/weatherbloc/weather_event.dart';
import 'package:cleanapp/src/presentation/bloc/weatherbloc/weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetCurrentWeather _getCurrentWeather;

  WeatherBloc(this._getCurrentWeather) : super(WeatherEmpty()) {
    on<OnCityChanged>((event, emit) async {
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
    });
  }
}
