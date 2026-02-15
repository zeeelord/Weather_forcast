import 'package:complete_weatherapp/model/weatherForcastmodel.dart';
import 'package:complete_weatherapp/network%20/network.dart';
import 'package:complete_weatherapp/ui/midView.dart';
import 'package:flutter/material.dart';

class WeatherForecast extends StatefulWidget {
  const WeatherForecast({super.key});

  @override
  State<WeatherForecast> createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  // ignore: non_constant_identifier_names
  Future<WeatherForecastModel>? ForeCastObject;
  final String _cityName = "London";
  @override
  void initState() {
    super.initState();
    ForeCastObject = Network().getWeatherForcast(cityName: _cityName);

    // print(ForeCastObject);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          textFieldView(),
          FutureBuilder(
            future: ForeCastObject,
            builder: (context, asyncSnapshot) {
              if (asyncSnapshot.hasData) {
                return Column(children: [midView(asyncSnapshot)]);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }

  Widget textFieldView() {
    return Card(
      child: TextField(
        decoration: InputDecoration(
          hintText: "Enter City Name",
          prefix: Icon(Icons.search),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          contentPadding: EdgeInsets.all(8),
        ),
        onSubmitted: (value) {},
      ),
    );
  }
}
