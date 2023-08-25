import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/weather_model.dart';

class DayForecast extends StatelessWidget {
  final WeatherModel weatherModel;
  final bool colored;
  const DayForecast({
    super.key,
    required this.weatherModel,
    required this.colored,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        // color: Colors.orange,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(40),
          bottom: Radius.circular(40),
        ),
        border: Border.all(width: 1),
        gradient: colored
            ? const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.amber, Colors.amberAccent, Colors.yellowAccent])
            : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            DateFormat('EEE').format(weatherModel.date),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "${weatherModel.date.day}/${weatherModel.date.month}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Image.network(weatherModel.iconPath),
          // Icon(
          //   weatherModel.iconPath,
          //   size: 24,
          //   color: Colors.white,
          // ),
          Text(
            "${weatherModel.avgTemp.toInt()}°C",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
