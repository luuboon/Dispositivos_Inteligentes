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
      filteredCities = cities
          .where((c) => c.toLowerCase().contains(query.toLowerCase()))
          .toList();
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
            child: TextField(
              onChanged: filterCities,
              decoration: const InputDecoration(
                hintText: 'Busca...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: filteredCities.isEmpty
                ? const Center(child: Text('Ninguna ciudad encontrada'))
                : ListView.builder(
                    itemCount: filteredCities.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(filteredCities[index]),
                        onTap: () {
                          Navigator.pop(context, filteredCities[index]);
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
