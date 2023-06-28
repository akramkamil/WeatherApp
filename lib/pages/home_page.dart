import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/providers/weather_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchPage()));
              },
              icon: const Icon(Icons.search))
        ],
        title: const Text('WeatherApp'),
      ),
      body:weatherData == null
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    'there is no weather 😒',
                    style: TextStyle(fontSize: 32),
                  ),
                  Text('start search now 🔍', style: TextStyle(fontSize: 32)),
                ],
              ),
            )
          : Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                  weatherData!.getThemeColor(),
                  weatherData!.getThemeColor()[100]!,
                  weatherData!.getThemeColor()[200]!,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 3,
                  ),
                   Text(
                    Provider.of<WeatherProvider>(context, listen: true).cityName.toString().toUpperCase(),
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'updated 11:11 Am',
                    style: TextStyle(fontSize: 22),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(weatherData!.getImage()),
                      Text(
                        weatherData!.temp.toString(),
                        style: const TextStyle(
                            fontSize: 31, fontWeight: FontWeight.bold),
                      ),
                      Column(
                        children: [
                          Text(
                            'Max: ' + weatherData!.maxtemp.toString(),
                            style: const TextStyle(fontSize: 22),
                          ),
                          Text(
                            'Min: ' + weatherData!.mintemp.toString(),
                            style: const TextStyle(fontSize: 22),
                          )
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  Text(
                    weatherData!.weatherStateName,
                    style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(flex: 5),
                ],
              ),
            ),
    );
  }
}
