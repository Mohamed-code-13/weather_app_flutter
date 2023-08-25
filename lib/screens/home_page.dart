import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/screens/add_city_screen.dart';
import 'package:weather_app/widgets/city_card.dart';
import 'package:weather_app/widgets/switch_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<WeatherModel> cities = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[50],
      appBar: AppBar(
        leading: const SwitchButton(),
        title: const Text("Weather App"),
        centerTitle: true,
        backgroundColor: Colors.yellow[50],
        // backgroundColor: Colors.amber,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(
                () => AddCityScreen(),
                transition: Transition.rightToLeft,
                arguments: addCity,
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SafeArea(
        child: cities.isEmpty ? _emptyScreen() : _displayingCities(),
      ),
    );
  }

  Center _emptyScreen() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("There is no cities yet!", style: TextStyle(fontSize: 22)),
          Text("Start adding new cities 🔍", style: TextStyle(fontSize: 22)),
        ],
      ),
    );
  }

  Widget _displayingCities() {
    return ListView.builder(
      itemCount: cities.length,
      itemBuilder: (BuildContext context, int index) =>
          CityCard(weatherModel: cities[index], removeCity: removeCity),
    );
  }

  void addCity(WeatherModel newCity) {
    if (cities.contains(newCity) == false) {
      setState(() {
        cities.add(newCity);
      });
    }
  }

  void removeCity(WeatherModel city) {
    setState(() {
      cities.remove(city);
    });
  }
}
