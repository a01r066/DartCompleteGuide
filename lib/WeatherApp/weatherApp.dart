import 'dart:io';

import 'package:dart_complete_guide/WeatherApp/weatherApiClient.dart';

Future<void> main(List<String> args) async {
  if(args.length != 1){
    print('Invalid argument!');
    return;
  }

  final city = args.first;
  final api = WeatherApiClient();

  // Fetch weather of locatonId
  try {
    final weather = await api.getWeather(city);
    print(weather);
  } on WeatherApiException catch (e){
    throw WeatherApiException('City not found: ${e.message}');
  } on SocketException catch(e){
    throw WeatherApiException('Could not fetch data. Check you connection: ${e.message}');
  } catch (e){
    print(e);
  }
}