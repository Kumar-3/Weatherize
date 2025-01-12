// core/services/preferences_service.dart
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton()
class PreferencesService {
  Future<String?> loadLastCity() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('last_city') ?? 'Pune'; // Default city
  }

  Future<bool> loadIsCelsius() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('is_celsius') ?? true; // Default to Celsius
  }

  Future<void> saveLastCity(String city) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('last_city', city);
  }

  Future<void> saveIsCelsius(bool isCelsius) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_celsius', isCelsius);
  }
}
