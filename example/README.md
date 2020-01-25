# Cuba Weather Red Cuba Dart Examples

Example of Dart client for [www.redcuba.cu](https://www.redcuba.cu) weather API. Given a municipality of Cuba, weather data on the municipality is obtained.

```dart
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
```
