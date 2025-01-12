import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/features/weather/domain/entities/daily_weather.dart';
import '../../domain/entities/weather.dart';
import '../../domain/repositories/weather_repository.dart';
import '../datasources/weather_remote_datasource.dart';

@LazySingleton(as: WeatherRepository)
class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;

  WeatherRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, Weather>> getWeather(
      String city, bool isCelsius) async {
    try {
      final weather = await remoteDataSource.fetchWeather(
          city, isCelsius ? 'metric' : 'imperial');
      return Right(weather);
    } on ServerFailure catch (failure) {
      return Left(ServerFailure(failure.message));
    } catch (error) {
      return Left(ServerFailure('An unexpected error occurred: $error'));
    }
  }

  @override
  Future<Either<Failure, List<DailyWeather>>> getWeatherForecast(
      String city, bool isCelsius) async {
    try {
      final weather = await remoteDataSource.fetchWeatherForecast(
          city, isCelsius ? 'metric' : 'imperial');
      return Right(weather);
    } on ServerFailure catch (failure) {
      return Left(ServerFailure(failure.message));
    } catch (error) {
      return Left(ServerFailure('An unexpected error occurred: $error'));
    }
  }
}
