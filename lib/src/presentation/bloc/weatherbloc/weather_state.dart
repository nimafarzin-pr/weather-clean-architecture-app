import 'package:cleanapp/src/domain/entities/weather_entity.dart';
import 'package:equatable/equatable.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object?> get props => [];
}

class WeatherEmpty extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherError extends WeatherState {
  final String message;

  const WeatherError(this.message);

  @override
  List<Object?> get props => [message];
}

class WeatherHasData extends WeatherState {
  final Weather result;

  const WeatherHasData(this.result);

  @override
  List<Object?> get props => [result];
}
