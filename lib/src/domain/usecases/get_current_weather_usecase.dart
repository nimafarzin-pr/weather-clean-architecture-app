import 'package:cleanapp/src/core/failure.dart';
import 'package:cleanapp/src/domain/entities/weather_entity.dart';
import 'package:cleanapp/src/domain/repositories/weather_repository.dart';
import 'package:dartz/dartz.dart';

class GetCurrentWeather {
  final WeatherRepository repository;

  GetCurrentWeather(this.repository);

  Future<Either<Failure, Weather>> execute(String cityName) {
    return repository.getCurrentWeather(cityName);
  }
}
