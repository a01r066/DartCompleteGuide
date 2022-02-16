import 'dart:convert';
import 'package:dart_complete_guide/WeatherApp/weather.dart';
import 'package:http/http.dart' as http;

class WeatherApiException implements Exception {
  final String message;
  WeatherApiException(this.message);

  @override
  String toString() {
    // TODO: implement toString
    return message;
  }
}

class WeatherApiClient {
  static const baseUrl = "https://www.metaweather.com/api";

  var client = http.Client();
  
  Future<int> getLocationId(String city) async {
    final locationUrl = Uri.parse('$baseUrl/location/search/?query=$city');
    try {
      final locationResponse = await client.get(locationUrl);
      if(locationResponse.statusCode != 200){
        throw WeatherApiException('Error getting locationId for city: $city');
      }

      final locationJson = jsonDecode(locationResponse.body) as List;
      if(locationJson.isEmpty){
        throw WeatherApiException('No location found for: $city');
      }

      final locationId = locationJson.first['woeid'] as int;
      return locationId;
    }
    finally {
      // client.close();
      print('Completed!');
    }
    return -1;
  }

  Future<Weather> fetchWeather(int locationId) async {
    final weatherUrl = Uri.parse('$baseUrl/location/$locationId');
    try {
      final weatherResponse = await client.get(weatherUrl);
      if(weatherResponse.statusCode != 200){
        throw WeatherApiException('Error getting weather for location: $locationId');
      }
      final weatherJson = jsonDecode(weatherResponse.body);
      final consolidatedWeather = weatherJson['consolidated_weather'] as List;
      if(consolidatedWeather.isEmpty){
        throw WeatherApiException('Weather data not available for locationId: $locationId');
      }
      final weather = Weather.fromJson(consolidatedWeather.first);
      return weather;
    } finally {
      print('Completed!');
    }
    return Weather(1001, 'State name', 15.0, 22.5);
  }

  Future<Weather> getWeather(String city) async {
    final locationId = await getLocationId(city);
    return fetchWeather(locationId);
  }
}