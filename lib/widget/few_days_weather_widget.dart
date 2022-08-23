import 'package:flutter/material.dart';

// custom widget that would show user
// weather forecast for 3 days

Widget fewDays(
  String? temp,
  String? lTemp,
  String? humidity,
  String? wind,
  String? location,
  String? day,
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
                '$lTemp℃',
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
                  Text("$temp "),
                ],
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.water_drop_rounded),
                  Text("$humidity "),
                ],
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.wind_power_outlined),
                  Text("$wind "),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            "$day",
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          )
        ],
      ),
    ),
  );
}
