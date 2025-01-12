import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/features/weather/domain/entities/daily_weather.dart';

import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart';

@LazySingleton()
class GetDailyWeather {
  final WeatherRepository repository;

  GetDailyWeather(this.repository);

  Future<Either<Failure, List<DailyWeather>>> call(
      String city, bool isCelsius) async {
    return await repository.getWeatherForecast(city, isCelsius);
  }
}
