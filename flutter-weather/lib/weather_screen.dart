import 'package:flutter/material.dart';
import 'package:flutter_presentation/cloud_cover_card.dart';
import 'package:flutter_presentation/humidity_card.dart';
import 'package:flutter_presentation/pressure_card.dart';
import 'package:flutter_presentation/temperature_card.dart';
import 'drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'weather_class.dart';

const String domain = "https://api.openweathermap.org/data/2.5/weather?";
const String apiKey = "ee1f89c8b71153788a0b3b9d045c3d71";

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  Weather weatherData = Weather.empty();

  @override
  void initState() {
    super.initState();
    getWeather();
  }

  getWeather() async {
    var uri = '${domain}q=Volos&appid=${apiKey}';
    var url = Uri.parse(uri);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = response.body;
      print(data);
      var decodedData = jsonDecode(data);
      setState(() {
        weatherData = Weather.fromJson(decodedData);
      });
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather')),
      drawer: const MyDrawer(),
      body: Container(
        color: Colors.lightBlue.shade100,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Icon(
                    Icons.pin_drop,
                    color: Colors.red,
                    size: 40,
                  ),
                  Text(
                    'Volos',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TemperatureCard(value: weatherData.temperature),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PressureCard(value: weatherData.pressure),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: HumidityCard(value: weatherData.humidity),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CloudCoverCard(value: weatherData.cloudCover),
            ),
          ],
        ),
      ),
    );
  }
}
