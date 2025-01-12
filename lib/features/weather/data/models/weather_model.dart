// lib/features/weather/data/models/weather_model.dart
import '../../domain/entities/weather.dart';

class WeatherModel extends Weather {
  WeatherModel({
    required super.city,
    required super.temperature,
    required super.description,
    required super.humidity,
    required super.weatherConditionCode,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      city: json['name'],
      temperature: json['main']['temp'],
      description: json['weather'][0]['description'],
      humidity: json['main']['humidity'],
      weatherConditionCode: json['weather'][0]['id'],
    );
  }
}
