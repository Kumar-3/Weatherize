import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weather_app/core/services/preferences_service.dart';
import 'package:weather_app/features/weather/domain/entities/daily_weather.dart';
import 'package:weather_app/features/weather/domain/usecases/get_daily_weather.dart';
import 'package:weather_app/features/weather/domain/usecases/get_weather.dart';
import '../../domain/entities/weather.dart';

@injectable
class WeatherProvider with ChangeNotifier {
  final GetWeather getWeatherUseCase;
  final GetDailyWeather getDailyWeatherUseCase;
  final PreferencesService preferencesService;

  WeatherProvider(
    this.getWeatherUseCase,
    this.getDailyWeatherUseCase,
    this.preferencesService,
  );

  Weather? _weather;
  List<DailyWeather>? _dailyWeather;
  bool _isCelsius = true;
  String? _lastCity;

  Weather? get weather => _weather;
  bool get isCelsius => _isCelsius;
  List<DailyWeather>? get dailyWeather => _dailyWeather;
  String? get lastCity => _lastCity;

  Future<void> loadPreferences() async {
    _lastCity = await preferencesService.loadLastCity();
    _isCelsius = await preferencesService.loadIsCelsius();
    notifyListeners();
  }

  Future<void> savePreferences() async {
    if (_lastCity != null) {
      await preferencesService.saveLastCity(_lastCity!);
    }
    await preferencesService.saveIsCelsius(_isCelsius);
  }

  Future<void> fetchWeather(String city) async {
    final result = await getWeatherUseCase.execute(city, _isCelsius);
    result.fold(
      (failure) {
        _showToast(failure.message);
      },
      (weatherData) async {
        _lastCity = city;
        _weather = weatherData;
        await savePreferences();
        fetchDailyWeather(city);
        notifyListeners();
      },
    );
  }

  Future<void> fetchDailyWeather(String city) async {
    final result = await getDailyWeatherUseCase.call(city, _isCelsius);
    result.fold(
      (failure) {
        _showToast(failure.message);
      },
      (weatherData) {
        _dailyWeather = weatherData;
        notifyListeners();
      },
    );
  }

  void toggleTemperatureUnit() async {
    _isCelsius = !_isCelsius;
    await savePreferences();
    if (_lastCity != null) {
      fetchWeather(_lastCity!);
    }
    notifyListeners();
  }

  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
