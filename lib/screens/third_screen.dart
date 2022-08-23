import 'package:flutter/material.dart';
import 'package:test_task_friflex/city_name.dart';
import 'package:test_task_friflex/model/few_days_weather_model.dart';
import 'package:test_task_friflex/services/few_days_weather_api_client.dart';
import 'package:test_task_friflex/widget/few_days_weather_widget.dart';

// 3 days forecast screen

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  // initializing model and api
  FewDaysWeatherApiClient fewDaysClient = FewDaysWeatherApiClient();
  FewDaysModel data = FewDaysModel();
  //getting data
  Future<void> fewDaysData() async {
    data = await fewDaysClient.getWeather(cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            // maybe it's better to use "pushNamedAndRemoveUntil",
            // because if user will decide to return to the third screen
            // he will make another api-call, but it's unnecessary
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: const Text('Few days weather forecast'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: fewDaysData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              data.list?.elementAt(0).main?.tempMin != null) {
            // if data != null and connection is done
            // there will appeare this containers
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
                  // custom widget, that shows weather information
                  // (not really good way to show data, I'll fix it)
                  fewDays(
                      data.list!.elementAt(4).main!.tempMax.toString(),
                      data.list!.elementAt(7).main!.tempMin.toString(),
                      data.list!.elementAt(7).main!.humidity.toString(),
                      data.list!.elementAt(7).wind!.speed.toString(),
                      data.city!.name,
                      data.list!.elementAt(7).dtTxt),
                  const SizedBox(height: 10),
                  fewDays(
                      data.list!.elementAt(12).main!.tempMax.toString(),
                      data.list!.elementAt(15).main!.tempMin.toString(),
                      data.list!.elementAt(15).main!.humidity.toString(),
                      data.list!.elementAt(15).wind!.speed.toString(),
                      data.city!.name,
                      data.list!.elementAt(15).dtTxt),
                  const SizedBox(height: 10),
                  fewDays(
                      data.list!.elementAt(20).main!.tempMax.toString(),
                      data.list!.elementAt(23).main!.tempMin.toString(),
                      data.list!.elementAt(23).main!.humidity.toString(),
                      data.list!.elementAt(23).wind!.speed.toString(),
                      data.city!.name,
                      data.list!.elementAt(23).dtTxt),
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
