import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_model.dart';

class WeatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiUrl = '4fcdb32555994de894174209231105';

  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weather;
   try {
     Uri url = Uri.parse(
        '$baseUrl/forecast.json?key=$apiUrl&q=$cityName&days=1&aqi=no&alerts=no');
    http.Response response = await http.get(url);

    Map<String, dynamic> data = jsonDecode(response.body);

     weather = WeatherModel.fromJson(data);
     
   } catch (e) {
     print(e);
   }

    return weather;
  }
}
