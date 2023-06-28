import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key, required this.cityName});
  final String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('weather screen'),
      ),
      body: Column(
        children: [
          Text('wronge ')
        ],
      ),
    );
  }
}