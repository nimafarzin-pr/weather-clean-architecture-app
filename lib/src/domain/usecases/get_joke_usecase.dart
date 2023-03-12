import 'package:cleanapp/src/domain/entities/joke_entity.dart';
import 'package:cleanapp/src/domain/repositories/joke_repository.dart';
import 'package:dartz/dartz.dart';

import 'package:cleanapp/src/core/failure.dart';

class GetJoke {
  final JokeRepository repository;
  GetJoke(
    this.repository,
  );

  Future<Either<Failure, Joke>> execute() {
    return repository.getJoke();
  }
}
