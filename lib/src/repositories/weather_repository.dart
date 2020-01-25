import 'dart:async';

import 'package:cuba_weather_redcuba_dart/src/data_providers/data_providers.dart';
import 'package:cuba_weather_redcuba_dart/src/models/models.dart';

/// Class to provide the functionality of obtaining weather data
class WeatherRepository {
  WeatherApiClient weatherApiClient;

  /// Class constructor
  WeatherRepository() {
    weatherApiClient = WeatherApiClient();
  }

  /// Method that given a source returns the weather data
  Future<WeatherModel> getWeather(SourceModel source) async {
    return await weatherApiClient.fetchWeather(source.name);
  }
}
