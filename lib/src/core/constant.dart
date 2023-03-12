class Urls {
  static const String weatherBaseUrl =
      'https://api.openweathermap.org/data/2.5';
  static const String jokeBaseUrl = 'https://official-joke-api.appspot.com/';
  static const String apiKey = 'cc95d932d5a45d33a9527d5019475f2c';
  static String currentWeatherByName(String city) =>
      '$weatherBaseUrl/weather?q=$city&appid=$apiKey';
  static String randomJoke() => '$jokeBaseUrl/random_joke';
  static String weatherIcon(String iconCode) =>
      'http://openweathermap.org/img/wn/$iconCode@2x.png';
}
