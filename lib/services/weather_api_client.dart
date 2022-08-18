import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_task_friflex/model/weather_model.dart';

class WeatherApiClient {
  Future<Weather>? getCurrentWeather(String? city) async {
    var point = Uri.parse(
      "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=f4242c370d762512357db4c0479d3532&units=metric",
    );

    var response = await http.get(point);
    var body = jsonDecode(response.body);

    Weather weather = Weather.fromJson(body);

    // print(weather.cityName);
    return weather;
  }
}