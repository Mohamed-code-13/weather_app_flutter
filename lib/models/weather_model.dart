class WeatherModel {
  late String cityName;
  late DateTime date;
  late double avgTemp;
  late double maxTemp;
  late double minTemp;
  late String iconPath;
  late String weatherState;
  List<WeatherModel> foreCast = [];

  WeatherModel({
    required this.cityName,
    required this.date,
    required this.avgTemp,
    required this.maxTemp,
    required this.minTemp,
    required this.iconPath,
    required this.weatherState,
  });

  WeatherModel.fromJson({required Map<String, dynamic> jsonData, int day = 0}) {
    cityName = jsonData['location']['name'];
    Map<String, dynamic> forecastDay = jsonData['forecast']['forecastday'][day];

    if (day == 0) {
      date = DateTime.parse(jsonData['current']['last_updated']);
    } else {
      date = DateTime.parse(forecastDay['date']);
    }

    avgTemp = forecastDay['day']['avgtemp_c'];
    maxTemp = forecastDay['day']['maxtemp_c'];
    minTemp = forecastDay['day']['mintemp_c'];
    iconPath = "https:${forecastDay['day']['condition']['icon']}";
    weatherState = forecastDay['day']['condition']['text'];
  }
}
