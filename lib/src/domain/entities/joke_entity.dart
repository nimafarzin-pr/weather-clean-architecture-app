import 'package:equatable/equatable.dart';

class Joke extends Equatable {
  const Joke({
    required this.id,
    required this.type,
    required this.setup,
    required this.punchline,
  });

  final int id;
  final String type;
  final String setup;
  final String punchline;

  @override
  List<Object?> get props => [id, type, setup, punchline];
}
