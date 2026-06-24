import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';
import '../services/ble_service.dart';

class BleScreen extends StatefulWidget {
  const BleScreen({Key? key}) : super(key: key);
  @override
  State<BleScreen> createState() => _BleScreenState();
}

class _BleScreenState extends State<BleScreen> {
  final BLEService _bleService = BLEService();
  bool _isScanning = false;

  void _toggleScan() {
    if (_isScanning) {
      _bleService.stopScan();
    } else {
      _bleService.scanForDevices();
    }
    setState(() => _isScanning = !_isScanning);
  }

  @override
  void dispose() {
    _bleService.stopScan();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WeatherProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Dispositivos BLE')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              onPressed: _toggleScan,
              icon: Icon(_isScanning ? Icons.stop : Icons.bluetooth_searching),
              label: Text(
                _isScanning ? 'Detener búsqueda' : 'Buscar dispositivos BLE',
              ),
            ),
          ),
          if (provider.isLoading) const CircularProgressIndicator(),
          Expanded(
            child: StreamBuilder<List<ScanResult>>(
              stream: FlutterBluePlus.scanResults,
              builder: (context, snapshot) {
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text('No hay dispositivos encontrados'),
                  );
                }
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final result = snapshot.data![index];
                    final name = result.device.platformName.isNotEmpty
                        ? result.device.platformName
                        : 'Desconocido';
                    return ListTile(
                      leading: const Icon(Icons.bluetooth),
                      title: Text(name),
                      subtitle: Text(result.device.remoteId.toString()),
                      trailing: ElevatedButton(
                        onPressed: () async {
                          _bleService.stopScan();
                          setState(() => _isScanning = false);
                          await provider.connectToWearable(result.device);
                          if (context.mounted) Navigator.pop(context);
                        },
                        child: const Text('Conectar'),
                      ),
                    );
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
