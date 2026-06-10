import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchQuery = '';
  List<String> cities = ['Santiago', 'Querétaro', 'México', 'Guadalajara'];
  List<String> filteredCities = [];

  @override
  void initState() {
    super.initState();
    filteredCities = cities;
  }

  void filterCities(String query) {
    setState(() {
      searchQuery = query;
      filteredCities = cities.where((c) => c.toLowerCase().contains(query.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buscar Ciudades')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(onChanged: filterCities, decoration: const InputDecoration(hintText: 'Busca...', border: OutlineInputBor            child: TextField(onChanged: f
                                                    nt          Text('No encontradas')) : ListView.builder(
              itemCount: filteredCities.length,
              itemBuilder: (c              itemBuildele(              itemBuilder: (c              itemBuildele(              itemBu()              itemBuilder: (c     dCi          ])              itemB                itemBu                 itemBuilder: );   }
              itemBuilder: (c     ho              itmp              itemBuildeeri              itemBuilder: (c     ho              itmp              itemBuildeeri              itepo      /u ils/          il              itemBuilder: (c     ho 


             iteexte             iteexte             iteexte             iteexr(             iteexri             iteeree             it) =>             iteexte             iteexte     e              iteexte             iteexte             iteexte             iteexr(             iteexri             iteeree             it) =>             iteexte             i(c             iteexte             iteexte             iteexte             iteexr(             iteexri      xt             iteexte             iteexte      ti             iteexte             iteexte             iteexte             iteexr(             iteexri             iteeree             it) =>             iteexte             iteexte     e              iteexte             iteexte             iteexte             rn Center(child: Text('Error: ${weatherData.errorMessage}'));
          if (weatherData.weather == null) return const Center(child: Text('No data'));

          final w = weatherData.weather!;
          final displayTemp = weatherData.temperatureUnit == '°C' ? w.temperature : WeatherUtils.celsiusToFahrenheit(w.temperature).toInt();

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(WeatherUtils.getWeatherIcon(w.condition), style: const TextStyle(fontSize: 80)),
                Text('$displayTemp${weatherData.temperatureUnit}', style: const TextStyle(fontSize: 72, fontWeight: FontWeight.bold)),
                Text(w.city, style: const TextStyle(fontSize: 24)),
                Text('Humidity: ${w.humidity}%'),
                const SizedBox(height: 20),
                ElevatedButton(onPressed: () => weatherData.toggleTemperatureUnit(), child: const Text('Cambiar unidad')),
                const SizedBox(height: 20),
                ElevatedButton(
                                                                                                    onst                                        ld                                                                                                    onst                                    < '                     impo                         ia                                                         'p                        r.                                                                                                    s                                                                                                     onst                            ovi                                                                  er                                              owCh                                          p', theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true), home: const HomeScreen()),
    );
  }
}
