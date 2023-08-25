import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/widgets/day_forecast_widget.dart';

class CityDetailsScreen extends StatelessWidget {
  final WeatherModel weatherModel;

  const CityDetailsScreen({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    String iconPath = weatherModel.iconPath.replaceAll('64', '128');

    return Scaffold(
      appBar: AppBar(
        title: Text(weatherModel.cityName),
        centerTitle: true,
        backgroundColor: Colors.tealAccent,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.tealAccent,
                // Colors.teal,
                Colors.blueAccent[100]!,
              ],
            ),
          ),
          child: Column(children: [
            Image.network(iconPath),
            Text(
              "${weatherModel.avgTemp.toInt()}°C",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 64,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              weatherModel.weatherState,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Max: ${weatherModel.maxTemp.toInt()}°C    Min: ${weatherModel.minTemp.toInt()}°C",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            _getLastUpdatedTime(),
            const Spacer(flex: 3),
            _getForeCast(),
            _deleteButton(context),
            const Spacer(flex: 1),
          ]),
        ),
      ),
    );
  }

  Text _getLastUpdatedTime() {
    String hours = weatherModel.date.hour.toString().padLeft(2, '0');
    String minutes = weatherModel.date.minute.toString().padLeft(2, '0');

    return Text(
      "Last Updated: $hours:$minutes",
      style: const TextStyle(color: Colors.white),
    );
  }

  Row _getForeCast() {
    int i = 1;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: weatherModel.foreCast
          .map((day) => DayForecast(weatherModel: day, colored: (i++ == 1)))
          .toList(),
    );
  }

  Widget _deleteButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Get.arguments(weatherModel);
        Get.back();
      },
      icon: const Icon(
        Icons.delete_forever,
        color: Colors.black,
      ),
      label: const Text(
        "Delete",
        style: TextStyle(color: Colors.black),
      ),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
    );
  }
}
