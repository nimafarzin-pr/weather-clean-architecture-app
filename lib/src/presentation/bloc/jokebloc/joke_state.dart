import 'package:cleanapp/src/domain/entities/joke_entity.dart';
import 'package:equatable/equatable.dart';

abstract class JokeState extends Equatable {
  const JokeState();

  @override
  List<Object?> get props => [];
}

class JokeEmpty extends JokeState {}

class JokeLoading extends JokeState {}

class JokeError extends JokeState {
  final String message;

  const JokeError(this.message);

  @override
  List<Object?> get props => [message];
}

class JokeHasData extends JokeState {
  final Joke result;

  const JokeHasData(this.result);

  @override
  List<Object?> get props => [result];
}
