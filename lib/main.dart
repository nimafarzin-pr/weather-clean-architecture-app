import 'package:cleanapp/src/presentation/bloc/jokebloc/joke_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cleanapp/src/presentation/bloc/weatherbloc/weather_bloc.dart';
import 'package:cleanapp/src/presentation/pages/weather_page.dart';

import 'src/injection.dart' as di;

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WeatherBloc>(
          create: (_) => di.locator<WeatherBloc>(),
        ),
        BlocProvider<JokeBloc>(
          create: (_) => di.locator<JokeBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Clean Architect',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: const WeatherPage(),
      ),
    );
  }
}
