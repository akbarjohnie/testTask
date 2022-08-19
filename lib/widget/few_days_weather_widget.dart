import 'package:flutter/material.dart';

Widget fewDays(
  String lTemp,
  String hTemp,
  String humidity,
  String wind,
  String location,
) {
  return Container(
    height: 150,
    width: 250,
    color: Colors.blue,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$location,',
                style: const TextStyle(color: Colors.black, fontSize: 25),
              ),
              const Icon(Icons.thermostat_rounded, size: 25),
              Text(
                '$hTemp℃',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.thermostat_rounded),
                  Text(lTemp),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.water_drop_rounded),
                  Text(humidity),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.wind_power_outlined),
                  Text(wind),
                ],
              )
            ],
          )
        ],
      ),
    ),
  );
}
