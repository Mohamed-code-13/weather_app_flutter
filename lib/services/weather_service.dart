import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

String YOUR_API_KEY = 'YOUR_API_KEY';

class WeatherService {
  static String baseUrl = 'https://api.weatherapi.com/v1';
  static String mode = 'forecast';
  static String apiKey = YOUR_API_KEY;
  static int forecastDays = 3;

  static Future<WeatherModel?> getWeather(String cityName) async {
    String link =
        '$baseUrl/$mode.json?key=$apiKey&q=$cityName&days=$forecastDays';
    Uri url = Uri.parse(link);

    http.Response response = await http.get(url);
    Map<String, dynamic> jsonData = json.decode(response.body);
    if (jsonData.length == 1 && jsonData.containsKey('error')) return null;

    WeatherModel weatherModel = WeatherModel.fromJson(jsonData: jsonData);

    weatherModel.foreCast.add(weatherModel);
    for (int i = 1; i < forecastDays; ++i) {
      weatherModel.foreCast.add(
        WeatherModel.fromJson(jsonData: jsonData, day: i),
      );
    }

    return weatherModel;
  }
}
