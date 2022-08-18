class Weather {
  String? cityName;
  double? temperature;
  double? wind;
  int? humidity;
  double? feelsLike;
  int? pressure;

  Weather({
    this.cityName,
    this.temperature,
    this.feelsLike,
    this.wind,
    this.humidity,
    this.pressure,
  });

  Weather.fromJson(Map<String, dynamic> json) {
    cityName = json['name'];
    temperature = json['main']['temp'];
    wind = json['wind']['speed'];
    pressure = json['main']['pressure'];
    humidity = json['main']['humidity'];
    feelsLike = json['main']['feels_like'];
  }
}
