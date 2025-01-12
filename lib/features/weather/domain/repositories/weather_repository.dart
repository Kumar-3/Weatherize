// lib/features/weather/domain/repositories/weather_repository.dart
import 'package:dartz/dartz.dart';
import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/features/weather/domain/entities/daily_weather.dart';

import '../entities/weather.dart';

abstract class WeatherRepository {
  Future<Either<Failure, Weather>> getWeather(String city, bool isCelsius);
  Future<Either<Failure, List<DailyWeather>>> getWeatherForecast(
      String city, bool isCelsius);
}
