import 'package:weather_forecast_app/common/utils/export.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final RemoteDataSource remoteDataSource;

  WeatherRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Weather>> getWeatherForCities(List<String> cityIds) async {
    try {
      final weatherModels = await remoteDataSource.getWeatherForCities(cityIds);
      final weatherEntities = weatherModels.map((model) => model.toEntity()).toList();
      return weatherEntities;
    } catch (e) {
 
      throw Exception('Failed to fetch weather for cities: $e');
    }
  }

  @override
  Future<Weather> getWeatherDetails(String cityId) async {
    try {
      final weatherModel = await remoteDataSource.getWeatherDetails(cityId);
      return weatherModel.toEntity();
    } catch (e) {
 
      throw Exception('Failed to fetch weather details: $e');
    }
  }
}
