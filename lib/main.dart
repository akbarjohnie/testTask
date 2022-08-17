import 'package:flutter/material.dart';
import 'package:test_task_friflex/screens/first_screen.dart';
import 'package:test_task_friflex/screens/second_screen.dart';
import 'package:test_task_friflex/screens/third_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FirstPage(),
      routes: {
        '/first/': (context) => const FirstPage(),
        '/second/': (context) => const SecondPage(),
        '/third/': (context) => const ThirdPage(),
      },
    );
  }
}
