import 'package:intl/intl.dart';
import 'package:weather_app/features/weather/domain/entities/daily_weather.dart';

class DailyWeatherModel extends DailyWeather {
  DailyWeatherModel({
    required super.date,
    required super.dayTemp,
    required super.minTemp,
    required super.maxTemp,
    required super.humidity,
    required super.description,
    required super.icon,
    required super.weatherConditionCode,
  });

  factory DailyWeatherModel.fromJson(Map<String, dynamic> json) {
    return DailyWeatherModel(
      date: _formatDate(json['dt'] as int),
      dayTemp: (json['temp']['day'] as num).toDouble(),
      minTemp: (json['temp']['min'] as num).toDouble(),
      maxTemp: (json['temp']['max'] as num).toDouble(),
      humidity: json['humidity'] ?? 0,
      description: json['weather']?[0]?['description'] ?? 'No description',
      icon: json['weather']?[0]?['icon'] ?? '01d',
      weatherConditionCode: json['weather']?[0]?['id'] ?? 800,
    );
  }

  // Converts a timestamp to a formatted date string
  static String _formatDate(int timestamp) {
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return DateFormat('yyyy-MM-dd').format(date);
  }
}
