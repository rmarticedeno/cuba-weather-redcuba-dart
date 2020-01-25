import 'dart:io';

import 'package:cuba_weather_redcuba_dart/cuba_weather_redcuba_dart.dart';

void main() {
  print('Insert municipality:');
  var input = stdin.readLineSync();
  var cubaWeatherRedCuba = CubaWeatherRedCuba();
  cubaWeatherRedCuba.get(input).then((weather) {
    print(weather);
  });
}
