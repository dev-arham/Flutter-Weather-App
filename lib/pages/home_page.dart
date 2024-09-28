import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String currentCity = "Karachi";
  bool isLoading = false;
  TextEditingController searchCityController = TextEditingController();
  final startWeatherService =
      WeatherService(apiKey: "Your_API_Here"); // Add your API Key here
  Weather? currentWeather;
  getWeather() async {
    String currentCity = await startWeatherService.getCurrentCity();
    try {
      setState(() {
        isLoading = true;
      });
      final weather = await startWeatherService.getWeather(currentCity);
      setState(() {
        currentWeather = weather;
        isLoading = false;
      });
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  getWeatherBySearch() async {
    String currentCity = searchCityController.text;
    try {
      isLoading = true;
      final weather = await startWeatherService.getWeather(currentCity);
      setState(() {
        currentWeather = weather;
      });
      searchCityController.clear();
      isLoading = false;
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  getWeatherAnimation(String? mainCondition) {
    switch (mainCondition?.toLowerCase()) {
      case "clear":
        return "assets/animations/sunny.json";
      case "clouds":
      case "smoke":
      case "dust":
      case "fog":
      case "haze":
      case "mist":
        return "assets/animations/cloudy.json";
      case "rain":
      case "drizzle":
      case "shower rain":
        return "assets/animations/rain.json";
      case "snow":
        return "assets/animations/snow.json";
      case "thunderstorm":
        return "assets/animations/thunder.json";
      default:
        return "assets/animations/sunny.json";
    }
  }

  @override
  void initState() {
    super.initState();
    getWeather();
  }

  openSearchDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: Colors.grey.shade900,
          title: const Text(
            "Search City",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "inter",
              fontSize: 24,
            ),
          ),
          content: TextField(
            controller: searchCityController,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: "inter",
              fontSize: 16,
            ),
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              hintText: "e.g. Karachi",
              hintStyle: const TextStyle(
                color: Colors.white,
                fontFamily: "inter",
                fontSize: 16,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade600),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Cancel",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "inter",
                  fontSize: 16,
                ),
              ),
            ),
            isLoading
                ? const CircularProgressIndicator()
                : TextButton(
                    onPressed: () {
                      if (searchCityController.text.isEmpty) {
                        Navigator.pop(context);
                        return;
                      }
                      getWeatherBySearch();
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Search",
                      style: TextStyle(
                        color: Colors.red.shade300,
                        fontFamily: "inter",
                        fontSize: 16,
                      ),
                    ),
                  ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            image: const DecorationImage(
                image: AssetImage("assets/images/gradient-bg.png"),
                fit: BoxFit.cover),
          ),
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    isLoading
                        ? const CircularProgressIndicator()
                        : IconButton(
                            onPressed: getWeather,
                            icon: const Icon(
                              Icons.location_on_outlined,
                              color: Colors.white,
                            ),
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.grey[600],
                            ),
                          ),
                    const Spacer(),
                    IconButton(
                      onPressed: openSearchDialog,
                      icon: const Icon(
                        Icons.search_outlined,
                        color: Colors.white,
                      ),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Lottie.asset(
                  getWeatherAnimation(currentWeather?.mainCondition),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          currentWeather?.cityName ?? "Loading City...",
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: "inter",
                            fontSize: 50,
                          ),
                        ),
                        Text(
                          "${(currentWeather?.temperature.round().toString()) ?? 0}°C",
                          style: TextStyle(
                              color: Colors.red.shade300,
                              fontFamily: "inter",
                              fontSize: 120,
                              height: 1),
                        ),
                        Text(
                          currentWeather?.mainCondition ??
                              "Loading Condition...",
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: "inter",
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "Feels Like ${currentWeather?.feelsLike.round().toString()}°C",
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: "inter",
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            "assets/images/humidity.png",
                            width: 50,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${currentWeather?.humidity.round().toString()}",
                            style: TextStyle(
                              color: Colors.grey.shade200,
                              fontFamily: "inter",
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset(
                            "assets/images/pressure.png",
                            color: Colors.white,
                            width: 50,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${currentWeather?.pressure.round().toString()}",
                            style: TextStyle(
                              color: Colors.grey.shade200,
                              fontFamily: "inter",
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset(
                            "assets/images/sea-level.png",
                            color: Colors.white,
                            width: 50,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${currentWeather?.seaLevel.round().toString()}",
                            style: TextStyle(
                              color: Colors.grey.shade200,
                              fontFamily: "inter",
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
