// To parse this JSON data, do
//
//     final joke = jokeFromJson(jsonString);

import 'dart:convert';

import 'package:cleanapp/src/domain/entities/joke_entity.dart';
import 'package:equatable/equatable.dart';

JokeModel jokeFromJson(String str) => JokeModel.fromJson(json.decode(str));

String jokeToJson(JokeModel data) => json.encode(data.toJson());

class JokeModel extends Equatable {
  const JokeModel({
    required this.id,
    required this.type,
    required this.setup,
    required this.punchline,
  });

  final int id;
  final String type;
  final String setup;
  final String punchline;

  factory JokeModel.fromJson(Map<String, dynamic> json) => JokeModel(
        id: json["id"],
        type: json["type"],
        setup: json["setup"],
        punchline: json["punchline"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "setup": setup,
        "punchline": punchline,
      };

  Joke toEntity() => Joke(
        id: id,
        type: type,
        setup: setup,
        punchline: punchline,
      );

  @override
  List<Object?> get props => [id, type, setup, punchline];
}
