import 'package:cuba_weather_municipality_dart/cuba_weather_municipality_dart.dart';

import 'package:cuba_weather_redcuba_dart/src/data_providers/data_providers.dart';
import 'package:cuba_weather_redcuba_dart/src/models/models.dart';

/// Class to provide the functionality of searching for a source
class SourceRepository {
  /// Method that returns the source closest to the given municipality.
  SourceModel getSource(MunicipalityModel municipality) {
    var queryLat = municipality.lat;
    var queryLon = municipality.lon;
    var bestSource = sources[0];
    var bestDistance = bestSource.distance(queryLat, queryLon);
    for (var i = 1; i < sources.length; ++i) {
      var tempSource = sources[i];
      var tempDistance = tempSource.distance(queryLat, queryLon);
      if (tempDistance < bestDistance) {
        bestSource = tempSource;
        bestDistance = tempDistance;
      }
    }
    return bestSource;
  }
}
