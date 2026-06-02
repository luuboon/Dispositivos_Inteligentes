import 'package:flutter/material.dart';
import 'search_screen.dart';
import '../widgets/weather_icon.dart';
import '../widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isLandscape = width > 600;

    List<Widget> content = [
      const Text(
        '24°C',
        style: TextStyle(
          fontSize: 72,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
      const SizedBox(height: 8),
      const Text('Santiago de Querétaro', style: TextStyle(fontSize: 24)),
      const SizedBox(height: 24),
      const WeatherIcon(condition: 'soleado', size: 120),
      const SizedBox(height: 24),
      const Text(
        'Humedad: 65% | Viento: 12 km/h',
        style: TextStyle(fontSize: 16),
      ),
      const SizedBox(height: 32),
      CustomButton(
        text: 'Buscar Ciudades',
        icon: Icons.search,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SearchScreen()),
          );
        },
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Clima Actual'), centerTitle: true),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: isLandscape
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(children: content.sublist(0, 3)),
                        Column(children: content.sublist(3)),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: content,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
