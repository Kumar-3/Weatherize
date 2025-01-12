// lib/features/weather/domain/usecases/get_weather.dart
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/core/error/failures.dart';
import '../entities/weather.dart';
import '../repositories/weather_repository.dart';

@LazySingleton()
class GetWeather {
  final WeatherRepository repository;

  GetWeather(this.repository);

  Future<Either<Failure, Weather>> execute(String city, bool isCelsius) async {
    return await repository.getWeather(city, isCelsius);
  }
}
