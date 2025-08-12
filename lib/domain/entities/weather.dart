import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final String cityName;
  final double temperature;
  final String mainCondition;
  final String description;
  final String iconCode;
  final int humidity;
  final double windSpeed;
  final int pressure;
  final int visibility;
  final double feelsLike;

  const Weather({
    required this.cityName,
    required this.temperature,
    required this.mainCondition,
    required this.description,
    required this.iconCode,
    required this.humidity,
    required this.windSpeed,
    required this.pressure,
    required this.visibility,
    required this.feelsLike,
  });

  @override
  List<Object?> get props => [
        cityName,
        temperature,
        mainCondition,
        description,
        iconCode,
        humidity,
        windSpeed,
        pressure,
        visibility,
        feelsLike,
      ];
}
