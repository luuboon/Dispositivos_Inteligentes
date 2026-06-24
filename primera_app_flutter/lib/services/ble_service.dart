import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BLEService {
  Stream<List<ScanResult>> scanForDevices() {
    FlutterBluePlus.startScan(timeout: const Duration(seconds: 10));
    return FlutterBluePlus.scanResults;
  }

  void stopScan() {
    FlutterBluePlus.stopScan();
  }

  Future<void> connect(BluetoothDevice device) async {
    // Solución al error de la actualización del paquete flutter_blue_plus
    // Pasamos null para cumplir con la firma de "Required named parameter"
    await device.connect(license: License.nonprofit);
  }

  Future<void> disconnect(BluetoothDevice device) async {
    await device.disconnect();
  }

  Future<Map<String, dynamic>?> readWeatherCharacteristic(
    BluetoothDevice device,
  ) async {
    List<BluetoothService> services = await device.discoverServices();
    for (var service in services) {
      for (var char in service.characteristics) {
        if (char.properties.read) {
          // Datos simulados extraídos del wearable
          String rawCity = "WearableCity";
          int rawTemp = 28;

          if (!_isValidData(rawCity, rawTemp)) return null;

          return {
            'city': rawCity,
            'temperature': rawTemp,
            'condition': 'sunny',
            'humidity': 50,
          };
        }
      }
    }
    return null;
  }

  bool _isValidData(String city, int temp) {
    if (city.length >= 50 || city.isEmpty) return false;
    if (temp < -60 || temp > 60) return false;
    return true;
  }
}
