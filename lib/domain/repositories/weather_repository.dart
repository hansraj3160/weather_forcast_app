
import '../entities/weather.dart';

abstract class WeatherRepository {
  Future<List<Weather>> getWeatherForCities(List<String> cityIds);
  Future<Weather> getWeatherDetails(String cityId);
}
