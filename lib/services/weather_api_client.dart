import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_task_friflex/model/weather_model.dart';

// to get data for current weather forecast
// with "WeatherM"

class WeatherApiClient {
  Future<WeatherM>? getCurrentWeather(String? city) async {
    final uri = Uri.parse(
      "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=f4242c370d762512357db4c0479d3532&units=metric",
    );

    final response = await http.get(uri);
    final body = jsonDecode(response.body);

    WeatherM weather = WeatherM.fromJson(body);

    if (response.statusCode == 200) {
      // returns weather if everything is fine
      return weather;
    } else {
      // exceptions on every other codeStatus from Api
      throw Exception('weather_api error');
    }
  }
}
