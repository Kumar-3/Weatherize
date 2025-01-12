import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:weather_app/core/config/config_reader.dart';
import '../error/failures.dart';

@lazySingleton
class NetworkHelper {
  final String baseUrl;
  final String apiKey;

  NetworkHelper()
      : baseUrl = 'https://api.openweathermap.org/data/2.5',
        apiKey = ConfigReader.apiKey;

  Future<Map<String, dynamic>> get(String endpoint) async {
    try {
      final response =
          await http.get(Uri.parse('$baseUrl$endpoint&appid=$apiKey'));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        final Map<String, dynamic> errorResponse = json.decode(response.body);
        final String errorMessage = errorResponse['message'].toString();
        throw ServerFailure(errorMessage);
      }
    } on SocketException {
      throw ServerFailure('No internet connection. Please check your network.');
    } on TimeoutException {
      throw ServerFailure('Request timeout. Please try again later.');
    }
  }
}
