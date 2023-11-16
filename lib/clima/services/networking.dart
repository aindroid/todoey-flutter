import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todoey_flutter/clima/services/weather_list.dart';

class WeatherRepository {
  final String _weatherApiKey = '353f6554473dca982f79924412125c0f';
  final String _endPoint3_0 = 'https://api.openweathermap.org/data/3.0/onecall';
  final String _endPoint2_5 = 'https://api.openweathermap.org/data/2.5/weather';

  Future<WeatherList> getWeatherLocation(String location) async {
    print(location);
    var response = await http.get(Uri.parse(
        '$_endPoint2_5?q=$location&appid=$_weatherApiKey&units=metric'));

    if (response.statusCode == 200) {
      print(response.body);
      return WeatherList.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<WeatherList> getWeather(double latitude, double longitude) async {
    var response = await http.get(Uri.parse(
        '$_endPoint2_5?lat=$latitude&lon=$longitude&appid=$_weatherApiKey&units=metric'));

    if (response.statusCode == 200) {
      print(response.body);
      return WeatherList.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load album');
    }
  }
}
