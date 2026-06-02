import 'package:flutter/material.dart';

class TemperatureCard extends StatelessWidget {
  final String day;
  final String temp;
  final String condition;

  const TemperatureCard({
    Key? key,
    required this.day,
    required this.temp,
    required this.condition,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              day,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Icon(
              condition == 'soleado' ? Icons.wb_sunny : Icons.cloud,
              color: condition == 'soleado' ? Colors.orange : Colors.grey,
            ),
            const SizedBox(height: 8),
            Text(
              temp,
              style: const TextStyle(fontSize: 18, color: Colors.blueAccent),
            ),
          ],
        ),
      ),
    );
  }
}
