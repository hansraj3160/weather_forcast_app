import '../../domain/entities/weather.dart';
class WeatherModel extends Weather {
  const WeatherModel({
    required super.cityName,
    required super.temperature,
    required super.mainCondition,
    required super.description,
    required super.iconCode,
    required super.humidity,
    required super.windSpeed,
    required super.pressure,
    required super.visibility,
    required super.feelsLike,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      mainCondition: json['weather'][0]['main'],
      description: json['weather'][0]['description'],
      iconCode: json['weather'][0]['icon'],
      humidity: json['main']['humidity'],
      windSpeed: json['wind']['speed'].toDouble(),
      pressure: json['main']['pressure'],
      visibility: json['visibility'],
      feelsLike: json['main']['feels_like'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': cityName,
      'main': {
        'temp': temperature,
        'feels_like': feelsLike,
        'pressure': pressure,
        'humidity': humidity,
      },
      'weather': [
        {
          'main': mainCondition,
          'description': description,
          'icon': iconCode,
        }
      ],
      'wind': {
        'speed': windSpeed,
      },
      'visibility': visibility,
    };
  }

  Weather toEntity() {
    return Weather(
      cityName: cityName,
      temperature: temperature,
      mainCondition: mainCondition,
      description: description,
      iconCode: iconCode,
      humidity: humidity,
      windSpeed: windSpeed,
      pressure: pressure,
      visibility: visibility,
      feelsLike: feelsLike,
    );
  }
}
