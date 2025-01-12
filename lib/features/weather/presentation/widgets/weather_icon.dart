// lib/features/weather/utils/weather_icon.dart
import 'package:flutter/material.dart';

Widget getWeatherIcon(int code, double size) {
  switch (code) {
    case >= 150 && < 300:
      return Image.asset('assets/images/1.png', height: size, width: size);
    case >= 300 && < 400:
      return Image.asset('assets/images/2.png', height: size, width: size);
    case >= 500 && < 600:
      return Image.asset('assets/images/3.png', height: size, width: size);
    case >= 600 && < 700:
      return Image.asset('assets/images/4.png', height: size, width: size);
    case >= 700 && < 800:
      return Image.asset('assets/images/5.png', height: size, width: size);
    case == 800:
      return Image.asset('assets/images/6.png', height: size, width: size);
    case > 800 && <= 804:
      return Image.asset('assets/images/7.png', height: size, width: size);
    default:
      return Image.asset('assets/images/7.png', height: size, width: size);
  }
}
