// lib/main.dart
import 'package:flutter/material.dart';
import 'package:weather_app/core/config/config_reader.dart';
import 'package:weather_app/core/di/service_locator.dart';

import 'features/weather/presentation/screens/weather_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ConfigReader.initialize();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherScreen.create(),
    );
  }
}
