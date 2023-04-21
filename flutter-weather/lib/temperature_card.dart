import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class TemperatureCard extends StatelessWidget {
  const TemperatureCard({super.key, required this.value});
  final double value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.12,
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade900,
            offset: const Offset(1, 2),
            blurRadius: 3,
            spreadRadius: 1,
          )
        ],
      ),
      child: Row(
        children: [
          const Icon(WeatherIcons.thermometer, size: 40),
          const SizedBox(
            width: 30,
          ),
          Text(
            'Temperature: ${value.toInt()} ºC',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
