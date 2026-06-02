import 'package:flutter/material.dart';

class WeatherIcon extends StatelessWidget {
  final String condition;
  final double size;

  const WeatherIcon({Key? key, required this.condition, this.size = 80})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    IconData iconData;
    Color iconColor;

    switch (condition.toLowerCase()) {
      case 'soleado':
        iconData = Icons.wb_sunny;
        iconColor = Colors.orange;
        break;
      case 'lluvia':
        iconData = Icons.water_drop;
        iconColor = Colors.blue;
        break;
      default:
        iconData = Icons.cloud;
        iconColor = Colors.grey;
    }

    return Icon(iconData, size: size, color: iconColor);
  }
}
