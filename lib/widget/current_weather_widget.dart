import 'package:flutter/material.dart';

// 'main' widget that shows temperature and city

Widget currentWeather(IconData icon, String temp, String location) {
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 10),
        Text(
          '$location ',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        Icon(
          icon,
          color: Colors.grey,
          size: 60,
        ),
        const SizedBox(height: 10),
        Text(
          '$temp ℃',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 40,
          ),
        ),
      ],
    ),
  );
}
