import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart';


abstract class RemoteDataSource {
  Future<List<WeatherModel>> getWeatherForCities(List<String> cityIds);
  Future<WeatherModel> getWeatherDetails(String cityId);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;
  final String _apiKey = '57bfbb0e6a61c76f622aa17d869c6003'; 
  final String _baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  RemoteDataSourceImpl({required this.client});

  @override
  Future<List<WeatherModel>> getWeatherForCities(List<String> cityIds) async {
    final List<Future<WeatherModel>> weatherFutures = [];
    for (var id in cityIds) {
      weatherFutures.add(getWeatherDetails(id));
    }
    return await Future.wait(weatherFutures);
  }

  @override
  Future<WeatherModel> getWeatherDetails(String cityId) async {
    final response = await client.get(
      Uri.parse('$_baseUrl?q=$cityId&appid=$_apiKey&units=metric'),
    );

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
