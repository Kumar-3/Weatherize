// lib/features/weather/domain/entities/weather.dart
class Weather {
  final String city;
  final double temperature;
  final String description;
  final int humidity;
  final int weatherConditionCode;

  Weather({
    required this.city,
    required this.temperature,
    required this.description,
    required this.humidity,
    required this.weatherConditionCode,
  });
}
