import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_task_friflex/model/few_days_weather_model.dart';

// to get data for 3 days forecast
// with "FewDaysModel"

abstract class FewDaysWeatherApi {
  Future<FewDaysModel> getWeather(String cityName);
}

class FewDaysWeatherApiClient implements FewDaysWeatherApi {
  @override
  Future<FewDaysModel> getWeather(String cityName) async {
    final uri = Uri.parse(
      'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&cnt=24&appid=49c515204f9a8c06ebd98db6767145ac&units=metric',
    );

    final response = await http.get(uri);
    final body = jsonDecode(response.body);
    FewDaysModel fewWeather = FewDaysModel.fromJson(body);

    if (response.statusCode == 200) {
      // returns weather if everything is fine
      return fewWeather;
    } else {
      // exceptions on every other codeStatus from Api
      throw Exception('few_days error');
    }
  }
}
