// lib/features/weather/presentation/widgets/search_and_unit_selector.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/weather_provider.dart';

class SearchAndUnitSelector extends StatelessWidget {
  final TextEditingController controller;

  const SearchAndUnitSelector({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WeatherProvider>(context);

    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            onSubmitted: (city) => provider.fetchWeather(city),
            decoration: InputDecoration(
              hintText: 'Search city',
              prefixIcon: const Icon(Icons.search, color: Colors.white38),
              suffixIcon: controller.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear, color: Colors.white38),
                      onPressed: () {
                        controller.clear();
                        FocusScope.of(context).unfocus();
                      },
                    )
                  : null,
              filled: true,
              fillColor: Colors.grey.withOpacity(0.2),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none,
              ),
              hintStyle: const TextStyle(color: Colors.white38),
            ),
            textInputAction: TextInputAction.search,
            onChanged: (value) {
              // Refresh UI when text changes
            },
            style: const TextStyle(
                color: Colors.white54, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(width: 8.0),
        Container(
          height: 55.0,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  if (!provider.isCelsius) {
                    provider.toggleTemperatureUnit();
                  }
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.ac_unit,
                      color: provider.isCelsius
                          ? Colors.lightBlue
                          : Colors.white38,
                    ),
                    const SizedBox(width: 4.0),
                    Text(
                      '°C',
                      style: TextStyle(
                        color: provider.isCelsius
                            ? Colors.lightBlue
                            : Colors.white38,
                        fontWeight: provider.isCelsius
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              const VerticalDivider(
                color: Colors.white38,
                thickness: 1.0,
                width: 20.0,
                endIndent: 10.0,
                indent: 10.0,
              ),
              GestureDetector(
                onTap: () {
                  if (provider.isCelsius) {
                    provider.toggleTemperatureUnit();
                  }
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.wb_sunny,
                      color:
                          !provider.isCelsius ? Colors.orange : Colors.white38,
                    ),
                    const SizedBox(width: 4.0),
                    Text(
                      '°F',
                      style: TextStyle(
                        color: !provider.isCelsius
                            ? Colors.orange
                            : Colors.white38,
                        fontWeight: !provider.isCelsius
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
