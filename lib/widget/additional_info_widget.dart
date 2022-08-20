import 'package:flutter/cupertino.dart';

// custom widget to show user additional
// information of current weather such as
// wind, humidity, pressure, feels_like

const textSt = TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500);
const addSt = TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400);

Widget additionalInfo(
  String feelsLike,
  String wind,
  String humidity,
  String pressure,
) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(18.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Feels like:', style: textSt),
                SizedBox(height: 20.0),
                Text(
                  'Wind:',
                  style: textSt,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$feelsLike ℃",
                  style: addSt,
                ),
                const SizedBox(height: 20.0),
                Text(
                  "$wind m/s",
                  style: addSt,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Pressure:',
                  style: textSt,
                ),
                SizedBox(height: 20.0),
                Text(
                  'Humidity:',
                  style: textSt,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${pressure}mm",
                  style: addSt,
                ),
                const SizedBox(height: 20.0),
                Text(
                  "$humidity%",
                  style: addSt,
                ),
              ],
            ),
          ],
        )
      ],
    ),
  );
}
