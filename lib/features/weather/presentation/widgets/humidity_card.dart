// lib/features/weather/presentation/widgets/humidity_card.dart
import 'package:flutter/material.dart';
import '../provider/weather_provider.dart';

class HumidityCard extends StatelessWidget {
  final WeatherProvider provider;

  const HumidityCard({Key? key, required this.provider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      color: Colors.white.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
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
    );
  }
}
