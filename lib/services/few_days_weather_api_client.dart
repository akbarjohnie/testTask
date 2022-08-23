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
