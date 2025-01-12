class DailyWeather {
  final String date; // Formatted date (e.g., "2023-12-25")
  final double dayTemp;
  final double minTemp;
  final double maxTemp;
  final int humidity;
  final String description;
  final String icon;
  final int weatherConditionCode;

  DailyWeather({
    required this.date,
    required this.dayTemp,
    required this.minTemp,
    required this.maxTemp,
    required this.humidity,
    required this.description,
    required this.icon,
    required this.weatherConditionCode,
  });
}
