import 'package:cleanapp/src/data/datasources/remote/remote_datasource.dart';
import 'package:cleanapp/src/data/repositories/joke_repository_impl.dart';
import 'package:cleanapp/src/data/repositories/weather_repository_impl.dart';
import 'package:cleanapp/src/domain/repositories/joke_repository.dart';
import 'package:cleanapp/src/domain/repositories/weather_repository.dart';
import 'package:cleanapp/src/domain/usecases/get_current_weather_usecase.dart';
import 'package:cleanapp/src/domain/usecases/get_joke_usecase.dart';
import 'package:cleanapp/src/presentation/bloc/jokebloc/joke_bloc.dart';
import 'package:cleanapp/src/presentation/bloc/weatherbloc/weather_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(() => WeatherBloc(locator()));
  locator.registerFactory(() => JokeBloc(locator()));

  // usecase
  locator.registerLazySingleton(() => GetCurrentWeather(locator()));
  locator.registerLazySingleton(() => GetJoke(locator()));

  // repository
  locator.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );
  locator.registerLazySingleton<JokeRepository>(
    () => JokeRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  // data source
  locator.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(
      client: locator(),
    ),
  );

  // external
  locator.registerLazySingleton(() => http.Client());
}
