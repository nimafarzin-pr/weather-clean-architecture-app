import 'package:cleanapp/src/core/failure.dart';
import 'package:cleanapp/src/domain/entities/joke_entity.dart';
import 'package:dartz/dartz.dart';

abstract class JokeRepository {
  Future<Either<Failure, Joke>> getJoke();
}
