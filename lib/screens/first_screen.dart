import 'package:flutter/material.dart';
import 'package:test_task_friflex/city_name.dart';
import 'package:test_task_friflex/dialogs/snackbar.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({
    Key? key,
  }) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final TextEditingController city = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Weather app'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: city,
                autocorrect: false,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.location_city_outlined),
                  labelText: 'City',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  // to avoid navitating with empty "city"
                  if (city.text == '') {
                    // shows snackbar for user to warn him
                    // that he should enter "city" to continue
                    snackBar('Enter any city', context);
                  } else {
                    // if "city" is not empty
                    // user will be moved to the next screen
                    Navigator.of(context).pushNamed('/second/');
                    cityName = city.text;
                  }
                },
                // decoration properties of the button
                minWidth: 100,
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
