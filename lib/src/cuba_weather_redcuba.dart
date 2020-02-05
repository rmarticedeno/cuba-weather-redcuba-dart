import 'dart:async';

import 'package:cuba_weather_municipality_dart/cuba_weather_municipality_dart.dart';
import 'package:cuba_weather_redcuba_dart/src/models/models.dart';
import 'package:cuba_weather_redcuba_dart/src/repositories/repositories.dart';

/// Main class to provide package functionality.
class CubaWeatherRedCuba {
  CubaWeatherMunicipality _cubaWeatherMunicipality;
  SourceRepository _sourceRepository;
  WeatherRepository _weatherRepository;

  /// Class constructor
  CubaWeatherRedCuba() {
    _cubaWeatherMunicipality = CubaWeatherMunicipality();
    _sourceRepository = SourceRepository();
    _weatherRepository = WeatherRepository();
  }

  /// Method that given a municipality searches the cuban municipalities to
  /// find the best match and returns the weather information.
  Future<WeatherModel> get(String input) async {
    var municipality = _cubaWeatherMunicipality.get(input, suggestion: true);
    var source = _sourceRepository.getSource(municipality);
    var weather = await _weatherRepository.getWeather(source);
    return WeatherModel(
      cityName: municipality.name,
      dt: WeatherDateModel(
        date: weather.dt.date,
        timezoneType: weather.dt.timezoneType,
        timezone: weather.dt.timezone,
      ),
      temp: weather.temp,
      iconWeather: weather.iconWeather,
      descriptionWeather: weather.descriptionWeather,
      windVelocity: weather.windVelocity,
      windDirection: weather.windDirection,
      windDirectionDescription: weather.windDirectionDescription,
      windDirectionDegree: weather.windDirectionDegree,
      windDirectionRadians: weather.windDirectionRadians,
      pressure: weather.pressure,
      humidity: weather.humidity,
    );
  }
}
