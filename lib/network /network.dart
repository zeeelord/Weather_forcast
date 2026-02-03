import 'dart:convert';

import 'package:complete_weatherapp/model/weatherForcastmodel.dart';
import 'package:complete_weatherapp/util%20/weather_forcast_util.dart';
import 'package:http/http.dart';

class Network {
  Future<WeatherForecastModel> getWeatherForcast({
    required String cityName,
  }) async {
    final util = WeatherForecastUtil.appId;
    var finalUrl =
        "http://api.openweathermap.org/data/2.5/weather?q=$cityName&APPID=$util&units=imperial";
    final response = await get(Uri.parse(finalUrl));
    print("URL: ${Uri.parse(finalUrl)}");
    if (response.statusCode == 200) {
      print("weather data: ${jsonDecode(response.body)}");
      return WeatherForecastModel.fromJson(jsonDecode(response.body));

      /// we are mapping it as weather object
    } else {
      throw Exception("Error getting weather forecast");
    }
  }
}
