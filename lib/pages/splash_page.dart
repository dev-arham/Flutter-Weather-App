import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/pages/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(
        const Duration(seconds: 3),
        context.mounted
            ? () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const HomePage()),
                );
              }
            : null);
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            "assets/images/logo.png",
          ),
          const SizedBox(height: 20),
          const Text(
            "Arham Tells Weather",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "inter",
              fontSize: 22,
            ),
          ),
        ]),
      ),
    );
  }
}
