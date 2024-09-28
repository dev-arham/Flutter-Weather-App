class Weather {
  final String cityName, mainCondition;
  final double temperature, feelsLike, humidity, pressure, seaLevel;

  Weather({
    required this.cityName,
    required this.mainCondition,
    required this.temperature,
    required this.feelsLike,
    required this.humidity,
    required this.pressure,
    required this.seaLevel,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      mainCondition: json['weather'][0]['main'],
      temperature: json['main']['temp'].toDouble(),
      feelsLike: json['main']['feels_like'].toDouble(),
      humidity: json['main']['humidity'].toDouble(),
      pressure: json['main']['pressure'].toDouble(),
      seaLevel: json['main']['sea_level'].toDouble(),
    );
  }
}
