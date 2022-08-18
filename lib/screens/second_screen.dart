import 'package:flutter/material.dart';
import 'package:test_task_friflex/model/weather_model.dart';
import 'package:test_task_friflex/services/weather_api_client.dart';
import 'package:test_task_friflex/widget/additional_info.dart';
import 'package:test_task_friflex/widget/current_weather.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  WeatherApiClient client = WeatherApiClient();
  Weather? data;

  Future<void> getData() async {
    data = await client.getCurrentWeather('Moscow');
  }

  // @override
  // void initState() {
  //   client.getCurrentWeather('Moscow');
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
              '/first/',
              (route) => false,
            );
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
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/third/', (route) => false);
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
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: [
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
          }
          return Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Something went wrong',
                ),
                CircularProgressIndicator()
              ],
            ),
          );
        },
      ),
    );
  }
}
