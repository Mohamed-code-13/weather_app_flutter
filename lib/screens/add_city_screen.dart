import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class AddCityScreen extends StatelessWidget {
  String? cityName;

  AddCityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[50],
      appBar: AppBar(
        title: const Text("Add City"),
        backgroundColor: Colors.yellow[50],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTextField(),
              const SizedBox(height: 22.0),
              _buildAddButton(),
            ],
          ),
        ),
      ),
    );
  }

  TextField _buildTextField() {
    return TextField(
      decoration: const InputDecoration(
        hintText: "Enter a city name",
        label: Text("Search"),
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.search),
      ),
      onChanged: (String val) => cityName = val,
    );
  }

  ElevatedButton _buildAddButton() {
    return ElevatedButton.icon(
      onPressed: () async {
        if (cityName != null) {
          WeatherModel? newCity = await WeatherService.getWeather(cityName!);
          if (newCity == null) return;

          Get.arguments(newCity);
          Get.back();
        }
        // Get.arguments(
        //   WeatherModel(
        //     cityName: 'Roma',
        //     date: DateTime.now(),
        //     avgTemp: 22,
        //     maxTemp: 90,
        //     minTemp: 10,
        //     iconPath: Icons.golf_course,
        //     weatherState: 'Great',
        //   ),
        // );
        // Get.back();
      },
      icon: const Icon(Icons.add),
      label: const Text("Add", style: TextStyle(fontSize: 18)),
    );
  }
}
