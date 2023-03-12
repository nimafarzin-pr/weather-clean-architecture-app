import 'dart:io';

import 'package:cleanapp/src/data/datasources/remote/remote_datasource.dart';
import 'package:cleanapp/src/core/exception.dart';
import 'package:cleanapp/src/core/failure.dart';
import 'package:cleanapp/src/domain/entities/weather_entity.dart';
import 'package:cleanapp/src/domain/repositories/weather_repository.dart';
import 'package:dartz/dartz.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final RemoteDataSource remoteDataSource;

  WeatherRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, Weather>> getCurrentWeather(String cityName) async {
    try {
      final result = await remoteDataSource.getCurrentWeather(cityName);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
