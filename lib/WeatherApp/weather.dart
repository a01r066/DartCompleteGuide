class Weather {
  final int id;
  final String weather_state_name;

  // final String weather_state_abbr;
  // final String wind_direction_compass;
  // "created":"2022-02-15T15":"59":01.678626Z,
  // "applicable_date":2022-02-16,
  final double min_temp;
  final double max_temp;
  // "the_temp":13.559999999999999,
  // "wind_speed":13.403542973970678,
  // "wind_direction":248.49489659935733,
  // "air_pressure":999.0,
  // "humidity":81,
  // "visibility":12.245672771017258,
  // "predictability":75
  Weather(this.id, this.weather_state_name, this.min_temp, this.max_temp);

  factory Weather.fromJson(Map<String, Object?> weatherJson) {
    final id = weatherJson['id'] as int;
    final weatherStateName = weatherJson['weather_state_name'] as String;
    final minTemp = weatherJson['min_temp'] as double;
    final maxTemp = weatherJson['max_temp'] as double;

    return Weather(id, weatherStateName, minTemp, maxTemp);
    // for(var weatherJson in consolidatedWeather){
    //   final id = weatherJson['id'];
    //   final weatherStateName = weatherJson['weather_state_name'];
    //   return Weather(id, weatherStateName);
    // }
    throw Exception('Could not decode json to object!');
  }

  @override
  String toString() {
    return 'id: $id\nstateName: $weather_state_name\nminTemp: ${min_temp.toStringAsFixed(0)}℃\nmaxTemp: ${max_temp.toStringAsFixed(0)}℃';
  }
}
