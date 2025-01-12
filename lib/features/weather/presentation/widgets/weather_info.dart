// lib/features/weather/presentation/widgets/weather_info.dart
import 'package:flutter/material.dart';
import 'package:weather_app/features/weather/presentation/widgets/weather_icon.dart';
import '../provider/weather_provider.dart';

class WeatherInfo extends StatelessWidget {
  final WeatherProvider provider;

  const WeatherInfo({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getWeatherIcon(provider.weather!.weatherConditionCode, 150),
        Center(
          child: Text(
            '${provider.weather!.temperature.round()}°${provider.isCelsius ? 'C' : 'F'}',
            style: const TextStyle(
                color: Colors.white, fontSize: 55, fontWeight: FontWeight.w600),
          ),
        ),
        Center(
          child: Text(
            provider.weather!.description.toUpperCase(),
            style: const TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500),
          ),
        ),
        Center(
          child: Text(
            provider.weather!.city,
            style: const TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          color: Colors.white.withOpacity(0.1),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.water_drop,
                  color: Colors.white70,
                  size: 36.0,
                ),
                const SizedBox(height: 8.0),
                const Text(
                  'Humidity',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  '${provider.weather!.humidity}',
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
