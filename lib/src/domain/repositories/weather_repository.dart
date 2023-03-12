import 'package:cleanapp/src/core/failure.dart';
import 'package:cleanapp/src/domain/entities/weather_entity.dart';
import 'package:dartz/dartz.dart';

abstract class WeatherRepository {
  Future<Either<Failure, Weather>> getCurrentWeather(
    String cityName,
  );
}
