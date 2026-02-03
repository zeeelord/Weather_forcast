import 'package:complete_weatherapp/model/weatherForcastmodel.dart';
import 'package:complete_weatherapp/network%20/network.dart';
import 'package:flutter/material.dart';

class WeatherForecast extends StatefulWidget {
  const WeatherForecast({super.key});

  @override
  State<WeatherForecast> createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  Future<WeatherForecastModel>? ForeCastObject;
  String _cityName = "Mumbai";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ForeCastObject = Network().getWeatherForcast(cityName: _cityName);
    // print(ForeCastObject);
    ForeCastObject!.then((weather) {
      print(weather.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ForeCastObject,
      builder: (context, asyncSnapshot) {
        return Scaffold(appBar: AppBar(title: Text("Forecast")));
      },
    );
  }
}
