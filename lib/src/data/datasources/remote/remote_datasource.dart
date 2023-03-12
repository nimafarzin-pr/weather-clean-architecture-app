import 'dart:convert';

import 'package:cleanapp/src/core/constant.dart';
import 'package:cleanapp/src/core/exception.dart';
import 'package:cleanapp/src/data/model/joke/joke_model.dart';
import 'package:cleanapp/src/data/model/weather/weather_model.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future<WeatherModel> getCurrentWeather(String cityName);
  Future<JokeModel> getJoke();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;
  RemoteDataSourceImpl({required this.client});

  @override
  Future<WeatherModel> getCurrentWeather(String cityName) async {
    final response =
        await client.get(Uri.parse(Urls.currentWeatherByName(cityName)));

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<JokeModel> getJoke() async {
    final response = await client.get(Uri.parse(Urls.randomJoke()));

    if (response.statusCode == 200) {
      return JokeModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
