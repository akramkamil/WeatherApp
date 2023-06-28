import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  double temp;
  double maxtemp;
  double mintemp;
  String weatherStateName;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxtemp,
      required this.mintemp,
      required this.weatherStateName});

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];

    return WeatherModel(
        date: data['location']['localtime'],
        temp: jsonData['avgtemp_c'],
        maxtemp: jsonData['maxtemp_c'],
        mintemp: jsonData['maxtemp_c'],
        weatherStateName: jsonData['condition']['text']);
  }

  @override
  String toString() {
    return 'temp : $temp';
  }

  String getImage (){
    if(weatherStateName == 'Clear' || weatherStateName == 'Light Cloud'){
      return 'assets/images/clear.png';
    }else if(weatherStateName == 'Sleet' || weatherStateName == 'Snow' || weatherStateName == 'Hail'){
      return 'assets/images/snow.png';
    }else if (weatherStateName == 'Heavy Cloud'){
      return 'assets/images/cloudy.png';
    }else if (weatherStateName == 'Heavy Rain' || weatherStateName == 'Light Rain' || weatherStateName == 'Shower' || weatherStateName == 'Moderate rain'){
      return 'assets/images/rainy.png';
    }else if (weatherStateName == 'Thunderstorm'){
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getThemeColor (){
    if(weatherStateName == 'Clear' || weatherStateName == 'Light Cloud'){
      return Colors.orange;
    }else if(weatherStateName == 'Sleet' || weatherStateName == 'Snow' || weatherStateName == 'Hail'){
      return Colors.blue;
    }else if (weatherStateName == 'Heavy Cloud'){
      return Colors.blueGrey;
    }else if (weatherStateName == 'Heavy Rain' || weatherStateName == 'Light Rain' || weatherStateName == 'Shower' || weatherStateName == 'Moderate rain'){
      return Colors.blue;
    }else if (weatherStateName == 'Thunderstorm'){
      return Colors.grey;
    } else {
      return Colors.orange;
    }
  }
}
