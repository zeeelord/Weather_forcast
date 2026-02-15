import 'package:complete_weatherapp/model/weatherForcastmodel.dart';
import 'package:flutter/material.dart';

Widget midView(asyncSnapshot) {
  var forcastList = asyncSnapshot.data;
  // final id = forcastList.weather?[0].id;
  // return Text("$id");
  var name = forcastList.name;
  Container midView = Container(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            "${name}, ${name}",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
  return midView;
}
