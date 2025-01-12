// lib/features/weather/presentation/screens/weather_screen.dart
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/features/weather/presentation/widgets/daily_weather.dart';
import 'package:weather_app/features/weather/presentation/widgets/search_and_unit_selector.dart';
import 'package:weather_app/features/weather/presentation/widgets/weather_info.dart';
import '../provider/weather_provider.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
  static Widget create() {
    return ChangeNotifierProvider(
      create: (_) => GetIt.I<WeatherProvider>(),
      builder: (context, child) {
        return const WeatherScreen();
      },
    );
  }
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<WeatherProvider>(context, listen: false);
      provider.loadPreferences().then((_) {
        if (provider.lastCity != null) {
          provider.fetchWeather(provider.lastCity!);
          provider.fetchDailyWeather(provider.lastCity!);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          false, // Allows layout resizing when keyboard is shown
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      ),
      body: Consumer<WeatherProvider>(
        builder: (context, provider, _) {
          return Padding(
            padding:
                const EdgeInsets.fromLTRB(30, 1.2 * kToolbarHeight, 30, 20),
            child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(3, -0.3),
                      child: Container(
                        height: 300,
                        width: 300,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.deepPurple),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-3, -0.3),
                      child: Container(
                        height: 300,
                        width: 300,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xFF673AB7)),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0, -1.2),
                      child: Container(
                        height: 300,
                        width: 600,
                        decoration:
                            const BoxDecoration(color: Color(0xFFFFAB40)),
                      ),
                    ),
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                      child: Container(
                        decoration:
                            const BoxDecoration(color: Colors.transparent),
                      ),
                    ),
                    Column(
                      children: [
                        SearchAndUnitSelector(controller: _controller),
                        provider.weather != null
                            ? WeatherInfo(provider: provider)
                            : const SizedBox(),
                        const SizedBox(height: 20.0),
                        if (provider.dailyWeather != null &&
                            provider.dailyWeather!.isNotEmpty)
                          DailyWeatherW(provider: provider),
                      ],
                    ),
                  ],
                )),
          );
        },
      ),
    );
  }
}
