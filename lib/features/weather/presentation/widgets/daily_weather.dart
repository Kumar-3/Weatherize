// lib/features/weather/presentation/widgets/daily_weather.dart
import 'package:flutter/material.dart';
import 'package:weather_app/features/weather/presentation/widgets/weather_icon.dart';
import '../provider/weather_provider.dart';

class DailyWeatherW extends StatelessWidget {
  final WeatherProvider provider;

  const DailyWeatherW({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: provider.dailyWeather!.length,
        itemBuilder: (context, index) {
          final day = provider.dailyWeather![index];
          return Card(
            color: Colors.white.withOpacity(0.1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.4,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  getWeatherIcon(provider.weather!.weatherConditionCode, 100),
                  const SizedBox(height: 8.0),
                  Text(
                    day.date,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    day.description,
                    style: const TextStyle(
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    '${day.dayTemp.round()}°${provider.isCelsius ? 'C' : 'F'}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
