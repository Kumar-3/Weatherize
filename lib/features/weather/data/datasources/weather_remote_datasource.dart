import 'package:injectable/injectable.dart';
import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/core/network/network_info.dart';
import 'package:weather_app/features/weather/data/models/daily_weather_model.dart';
import '../models/weather_model.dart';
import 'dart:io';

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> fetchWeather(String city, String unit);
  Future<List<DailyWeatherModel>> fetchWeatherForecast(
      String city, String unit);
}

@LazySingleton(as: WeatherRemoteDataSource)
class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final NetworkHelper networkHelper;

  WeatherRemoteDataSourceImpl(this.networkHelper);

  @override
  Future<WeatherModel> fetchWeather(String city, String unit) async {
    try {
      final endpoint = '/weather?q=$city&units=$unit';
      final responseData = await networkHelper.get(endpoint);
      final weatherData = WeatherModel.fromJson(responseData);
      return weatherData;
    } on SocketException {
      throw ServerFailure('No internet connection. Please check your network.');
    } on FormatException {
      throw ServerFailure('Invalid response format. Please try again later.');
    } on ServerFailure catch (e) {
      throw ServerFailure(e.message);
    } catch (error) {
      throw ServerFailure('Unexpected error occurred: $error');
    }
  }

  @override
  Future<List<DailyWeatherModel>> fetchWeatherForecast(
      String city, String unit) async {
    try {
      final endpoint = '/forecast/daily?q=$city&cnt=4&units=$unit';
      final responseData = await networkHelper.get(endpoint);
      final List<DailyWeatherModel> weatherData = (responseData['list'] as List)
          .map((e) => DailyWeatherModel.fromJson(e))
          .toList();
      return weatherData;
    } on SocketException {
      throw ServerFailure('No internet connection. Please check your network.');
    } on FormatException {
      throw ServerFailure('Invalid response format. Please try again later.');
    } on ServerFailure catch (e) {
      throw ServerFailure(e.message); // Throwing the message correctly
    } catch (error) {
      throw ServerFailure('Unexpected error occurred: $error');
    }
  }
}
