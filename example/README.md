# Cuba Weather Red Cuba Dart Examples

Example of application programming interface of the Cuba Weather project for [www.redcuba.cu](https://www.redcuba.cu) implemented in Dart.

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
