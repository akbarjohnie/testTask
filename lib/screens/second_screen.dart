import 'package:flutter/material.dart';
import 'package:test_task_friflex/city_name.dart';
import 'package:test_task_friflex/model/weather_model.dart';
import 'package:test_task_friflex/services/weather_api_client.dart';
import 'package:test_task_friflex/widget/additional_info_widget.dart';
import 'package:test_task_friflex/widget/current_weather_widget.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  // api and model
  WeatherApiClient client = WeatherApiClient();
  WeatherM? data;

  Future<void> getData() async {
    data = await client.getCurrentWeather(cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:
            false, // to customize transition to previous screen
        leading: IconButton(
          // (here is a lot to do with it)
          onPressed: () {
            // removing screen
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
          ),
          splashRadius: 25,
        ),
        title: const Text('Current Weather'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // to avoid unnecessary api call
              // I used "pushNamed" except of "pushNamedAndRemoveUntil"
              // with bloc state management it wouldn't be necessary
              // but for now it's better than nothing
              Navigator.of(context).pushNamed('/third/');
            },
            icon: const Icon(
              Icons.arrow_forward_ios_rounded,
            ),
            splashRadius: 25,
          )
        ],
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          // different connection states
          if (snapshot.connectionState == ConnectionState.done &&
              data?.temperature.toString() != null) {
            return Column(
              children: [
                // custom widget with city&temperature
                currentWeather(
                  Icons.cloud_sharp,
                  '${data!.temperature}',
                  '${data!.cityName}',
                ),
                const SizedBox(height: 20),
                const Text(
                  'Additional information',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Divider(color: Colors.grey, thickness: 1),
                ),
                // custom widget with data from api
                additionalInfo(
                  data!.temperature.toString(),
                  data!.wind.toString(),
                  data!.humidity.toString(),
                  data!.pressure.toString(),
                )
              ],
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            // if data is null, or user had made a mistake in city name,
            // or there was any other issue, this screen will appear
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Something went wrong... \n \nPlease try again',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(width: 10),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
