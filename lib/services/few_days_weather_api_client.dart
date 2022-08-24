import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_task_friflex/model/few_days_weather_model.dart';

// to get data for 3 days forecast
// with "FewDaysModel"

class FewDaysWeatherApiClient {
  Future<FewDaysModel> getWeather(String cityName) async {
    final uri = Uri.parse(
      'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&appid=49c515204f9a8c06ebd98db6767145ac&units=metric&cnt=24',
    );
    // &units=metric -- to get data in metric system
    // &cnt=24 -- to get data for 72 hours == 3 days
    // q=$cityName -- to get data of the entered city
    // &appid=... -- apiKey
    // may be it's better to use "https" except of "parse"

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      // returns weather if everything is fine
      return FewDaysModel.fromJson(json.decode(response.body));
    } else {
      // exceptions on every other codeStatus from Api
      throw Exception('few_days error');
    }
  }
}
