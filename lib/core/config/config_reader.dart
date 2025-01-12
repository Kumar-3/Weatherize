// Dart imports:
import 'dart:convert' show json;

// Flutter imports:
import 'package:flutter/services.dart' show rootBundle;

/// abstract class responsible for loading host property from config.json
/// This class loads a sensitive API Host uri from config.json
abstract class ConfigReader {
  static late Map<String, dynamic> _config;

  static String configPath = 'config/app_config.json';

  /// Call this method before running the app
  static Future<void> initialize() async {
    final configurationString = await rootBundle.loadString(configPath);

    _config = json.decode(configurationString) as Map<String, dynamic>;
  }

  /// API_KEY getter
  static String get apiKey => _config['API_KEY'] as String;
}
