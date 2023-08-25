import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/screens/city_details_screen.dart';

class CityCard extends StatelessWidget {
  WeatherModel weatherModel;
  Function(WeatherModel) removeCity;

  CityCard({super.key, required this.weatherModel, required this.removeCity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => CityDetailsScreen(weatherModel: weatherModel),
          transition: Transition.fadeIn,
          arguments: removeCity,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.deepPurpleAccent,
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.tealAccent,
                // Colors.teal,
                Colors.blueAccent[100]!,
              ]),
        ),
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _getCityName(),
            _getTemperature(),
            _getWeatherState(),
          ],
        ),
      ),
    );
  }

  Text _getCityName() {
    return Text(
      weatherModel.cityName,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Column _getTemperature() {
    return Column(
      children: [
        Text(
          "${weatherModel.avgTemp.toInt()} °C",
          style: const TextStyle(
            // color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "Max: ${weatherModel.maxTemp.toInt()}°C  Min: ${weatherModel.minTemp.toInt()}°C",
        ),
      ],
    );
  }

  Column _getWeatherState() {
    return Column(
      children: [
        Image.network(weatherModel.iconPath),
        // Icon(weatherModel.iconPath, size: 50),
        Text(
          weatherModel.weatherState,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 15),
        ),
      ],
    );
  }
}
