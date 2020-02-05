/// Model class for mapping the json returned by the https://www.redcuba.cu
/// weather API
class WeatherModel {
  final String cityName;
  final WeatherDateModel dt;
  final double temp;
  final double pressure;
  final double humidity;
  final String iconWeather;
  final double windVelocity;
  final CardinalPoint windDirection;
  final String windDirectionDescription;
  final int windDirectionDegree;
  final String descriptionWeather;

  /// Class constructor
  const WeatherModel({
    this.cityName,
    this.dt,
    this.temp,
    this.pressure,
    this.humidity,
    this.iconWeather,
    this.windVelocity,
    this.windDirection,
    this.windDirectionDescription,
    this.windDirectionDegree,
    this.descriptionWeather,
  });

  /// Static method that returns an instance of the class from the json provided
  static WeatherModel fromJson(dynamic json) {
    final data = json['data'];
    var windString = data['windstring'];
    var beginIndex = windString.indexOf('Velocidad') + 9;
    var endIndex = windString.indexOf('m/s');
    var windVelocityString = windString.substring(beginIndex, endIndex).trim();
    var windVelocity = double.parse(windVelocityString) * 3.6;
    beginIndex = endIndex + 3;
    endIndex = windString.length;
    var windDirectionDesc = windString.substring(beginIndex, endIndex).trim();
    var windDegree = _parseWindDegree(windDirectionDesc);
    return WeatherModel(
      cityName: data['cityName'],
      dt: WeatherDateModel.fromJson(data['dt']),
      temp: double.parse(data['temp'].toString()),
      pressure: double.parse(data['pressure'].toString()),
      humidity: double.parse(data['humidity'].toString()),
      iconWeather: data['iconWeather'],
      windVelocity: windVelocity,
      windDirection: _parseDirection(windDirectionDesc),
      windDirectionDegree: windDegree,
      windDirectionDescription: windDirectionDesc,
      descriptionWeather: data['descriptionWeather'],
    );
  }

  @override
  String toString() {
    var result = StringBuffer();
    result.write('City Name: ${cityName}\n');
    result.write('Temperature: ${temp}°C\n');
    result.write('Timestamp: ${dt.date}\n');
    result.write('Humidity: ${humidity}%\n');
    result.write('Pressure: ${pressure} hpa\n');
    result.write('Wind Velocity: ${windVelocity} Km/h\n');
    result.write('Wind Direction: ${windDirection}\n');
    result.write('Wind Direction Description: ${windDirectionDescription}\n');
    result.write('Wind Direction Degree: ${windDirectionDegree}\n');
    result.write('Description: ${descriptionWeather}\n');
    result.write('Image Link: ${iconWeather}');
    return result.toString();
  }

  static int _parseWindDegree(String input){
    var degree = input.split(' ')[1].substring(1);
    return int.parse(degree);
  }

  static CardinalPoint _parseDirection(String input) {
    var direction = input.split(' ')[0].toLowerCase().trim();
    switch (direction) {
      case 'norte-noreste':
        return CardinalPoint.North_Northeast;
      case 'noreste':
        return CardinalPoint.Northeast;
      case 'este-noreste':
        return CardinalPoint.East_Northeast;
      case 'este':
        return CardinalPoint.East;
      case 'este-sureste':
        return CardinalPoint.East_Southeast;
      case 'sureste':
        return CardinalPoint.Southeast;
      case 'sur-sureste':
        return CardinalPoint.South_Southeast;
      case 'sur':
        return CardinalPoint.South;
      case 'sur-suroeste':
        return CardinalPoint.South_Southwest;
      case 'suroeste':
        return CardinalPoint.Southwest;
      case 'oeste-suroeste':
        return CardinalPoint.West_Southwest;
      case 'oeste':
        return CardinalPoint.West;
      case 'oeste-noroeste':
        return CardinalPoint.West_Northwest;
      case 'noroeste':
        return CardinalPoint.Northwest;
      case 'norte-noroeste':
        return CardinalPoint.North_Northwest;
      case 'norte':
        return CardinalPoint.North;
      default:
        return CardinalPoint.North;
    }
  }
}

/// Model class for mapping part of the json returned by the
/// https://www.redcuba.cu weather API
class WeatherDateModel {
  final DateTime date;
  final double timezoneType;
  final String timezone;

  /// Class constructor
  const WeatherDateModel({this.date, this.timezoneType, this.timezone});

  /// Static method that returns an instance of the class from the json provided
  static WeatherDateModel fromJson(dynamic json) {
    return WeatherDateModel(
      date: DateTime.parse(json['date']),
      timezoneType: double.parse(json['timezone_type'].toString()),
      timezone: json['timezone'],
    );
  }
}

/// Cardinal Point directions source: https://www.ecured.cu/Velocidad_del_viento
enum CardinalPoint {
  North,
  North_Northeast,
  Northeast,
  East_Northeast,
  East,
  East_Southeast,
  Southeast,
  South_Southeast,
  South,
  South_Southwest,
  Southwest,
  West_Southwest,
  West,
  West_Northwest,
  Northwest,
  North_Northwest,
}
