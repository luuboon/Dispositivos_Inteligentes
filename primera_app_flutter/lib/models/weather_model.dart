class Weather {
  final String city;
  final int temperature;
  final String condition;
  final int humidity;

  Weather({required this.city, required this.temperature, required this.condition, required this.humidity});

  factory Weather.fromJson(Map<String, dynamic> json) {
    if (!json.containsKey('main')) throw const FormatException('Missing main field');
    final temp = json['main']['temp'];
    if (temp is! num) throw const FormatException('Temperature must be number');
    return Weather(
      city: json['name'] ?? 'Unknown',
      temperature: temp.toInt(),
      condition: (json['weather'] as List?)?.isNotEmpty == true ? json['weather'][0]['main'] ?? 'unknown' : 'unknown',
      humidity: json['main']['humidity'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {'city': city, 'temperature': temperature, 'condition': condition, 'humidity': humidity};
  
  @override
  String toString() => 'Weather(city: $city, temp: $temperature°C, condition: $condit  String toString() => 'Weather(city: $cit 'E  String tutils/weather_utils.dart
clcss WeatherUtils {
  stat  stat  stat  stat  statnh  stat  stat  s) => (ce  stat  stat  stat  stat  statnh  stat  stat  s) => (ce  stat  stat  stat  stat  statnh  stat  stat  s) =oInt(  stat  stat  stat  stat  statnh  stat  stat  s) => (c    stat  stat  stat  stat  statnh  stat  stat  s) => (ce  stat  stat  stat  stat  ase '  stat  stat  stat  stat  statnh  sta'r  stat  stat  stat  stat  statnh  stat  stat  s) => (ce  stat  stat  stat  stattu  stat  stat  stat}
  stat  stat  stat  stat  statnh  se(in  stat  stat  stat  stat  statn<=  stat  stat  stat  stat  statnh  se(in  stat  stat  stat  stat  statn<=  stat  stat  stat  stat  statnh  se(in  statel  stat  stat  stat  stat  statnh  se(in  sder e tends   ang  stat  stat  stat  stat  statnh  se(in  stat  stat  stat  stat  statn<=  stat  stat  stat  stat  statnh  se(in  stat  statwe th  stat  stth  stat  stat  stat  stat  statnh  se(in  stat  stat  stat  stat  statn<=  stat  stat  stat  stat  statnh  se(in  stat  stat  stat  stat  statn<=  stat  stat  staid> l  stat  stat  stat it  stat  stat  stat  stat  statnh  se(in  stat  stat  stat  stat  statn<=  stat  stat  stat  stat  statnh  se(in  stat  stat  stat  stat  statn<=  stat  stat  stat  stat  statnh  se(in  statel  stat  stat  stat  stat  statnh  se(in  sder e tends   ang  stat  stat  stat  stat  statnh  se(in  stat  stat  stat  stat  statn<=  stat  stat  stat  stat  statnh  se(in  stat  statwe th  stat  stth  stat  stat  stat  stat  statnh  se(in  stat  stat  st  eather!.condition, humidity: _weather!.humidity);
      notifyListeners();
    }
  }
}
