import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
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
      body: Column(children: []),
    );
  }
}
