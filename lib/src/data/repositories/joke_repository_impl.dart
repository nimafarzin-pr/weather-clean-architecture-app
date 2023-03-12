import 'dart:io';

import 'package:cleanapp/src/data/datasources/remote/remote_datasource.dart';
import 'package:cleanapp/src/core/exception.dart';
import 'package:cleanapp/src/core/failure.dart';
import 'package:cleanapp/src/domain/entities/joke_entity.dart';
import 'package:cleanapp/src/domain/repositories/joke_repository.dart';
import 'package:dartz/dartz.dart';

class JokeRepositoryImpl implements JokeRepository {
  final RemoteDataSource remoteDataSource;

  JokeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, Joke>> getJoke() async {
    try {
      final result = await remoteDataSource.getJoke();
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
