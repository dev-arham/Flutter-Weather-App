# Weather App

A simple Flutter-based weather application that displays current weather information for a specified city. It utilizes the OpenWeatherMap API for fetching weather data and includes features such as location detection and city search.

## Features

- Splash screen with an animated logo
- Displays current weather conditions including temperature, humidity, pressure, and more
- Allows users to search for weather information by city
- Retrieves user's current city location for weather updates

## Tech Stack

- Flutter
- Dart
- OpenWeatherMap API
- Geolocation services
- Lottie animations

## Getting Started

### Prerequisites

- Flutter SDK
- Dart
- A code editor (e.g., VS Code, Android Studio)
- An API key from [OpenWeatherMap](https://openweathermap.org/api)

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/dev-arham/Flutter-Weather-App.git
   ```

2. Navigate to the project directory:

   ```bash
   cd Flutter-Weather-App
   ```

3. Install the dependencies:

   ```bash
   flutter pub get
   ```

4. Replace `Your_API_Here` in `home_page.dart` with your actual OpenWeatherMap API key.

5. Run the app:

   ```bash
   flutter run
   ```

## Usage

- Open the app to see the splash screen.
- The app will automatically detect your location and display the current weather.
- Use the search button to find weather information for any city.

## Folder Structure

```
weather_app/
├── lib/
│   ├── models/
│   │   └── weather_model.dart
│   ├── pages/
│   │   ├── home_page.dart
│   │   └── splash_page.dart
│   ├── services/
│   │   └── weather_service.dart
│   └── main.dart
├── assets/
│   ├── animations/
│   └── images/
└── pubspec.yaml
```

## Contributing

If you would like to contribute to this project, feel free to fork the repository and submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [OpenWeatherMap](https://openweathermap.org/api) for providing weather data.
- [Flutter](https://flutter.dev/) for a great framework to build cross-platform apps.
- [Lottie](https://lottiefiles.com/) for easy-to-use animations.

---