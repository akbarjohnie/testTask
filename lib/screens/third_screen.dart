import 'package:flutter/material.dart';
import 'package:test_task_friflex/city_name.dart';
import 'package:test_task_friflex/main.dart';
import 'package:test_task_friflex/model/few_days_weather_model.dart';
import 'package:test_task_friflex/services/few_days_weather_api_client.dart';
import 'package:test_task_friflex/widget/few_days_weather_widget.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  FewDaysWeatherApiClient fewDaysClient = FewDaysWeatherApiClient();
  FewDaysModel data = FewDaysModel();
  // ListModel mainData = ListModel();
  List<ListModel>? mainData;

  Future<void> fewDaysData() async {
    data = await fewDaysClient.getWeather(cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
              '/second/',
              (route) => false,
            );
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: const Text('Few days weather'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: fewDaysData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              alignment: const Alignment(0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Weather for the next 3 days:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 50),
                  fewDays('', '20', '60', '3', cityName),
                  const SizedBox(height: 10),
                  fewDays('6', '20', '60', '3', cityName),
                  const SizedBox(height: 10),
                  fewDays('6', '20', '60', '3', cityName),
                ],
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Something went wrong'),
                  SizedBox(height: 10),
                  CircularProgressIndicator(),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
