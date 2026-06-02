import 'package:flutter/material.dart';
import '../widgets/temperature_card.dart';
import '../widgets/custom_button.dart';

class DetailScreen extends StatelessWidget {
  final String city;

  const DetailScreen({Key? key, required this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$city - 5 Días')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 12.0,
                  runSpacing: 12.0,
                  children: const [
                    TemperatureCard(
                      day: 'Lun',
                      temp: '24°C',
                      condition: 'soleado',
                    ),
                    TemperatureCard(
                      day: 'Mar',
                      temp: '26°C',
                      condition: 'soleado',
                    ),
                    TemperatureCard(
                      day: 'Mié',
                      temp: '20°C',
                      condition: 'nublado',
                    ),
                    TemperatureCard(
                      day: 'Jue',
                      temp: '25°C',
                      condition: 'soleado',
                    ),
                    TemperatureCard(
                      day: 'Vie',
                      temp: '28°C',
                      condition: 'nublado',
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                CustomButton(
                  text: 'Volver',
                  icon: Icons.arrow_back,
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
