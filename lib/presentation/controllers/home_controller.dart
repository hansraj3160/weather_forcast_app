import '../../common/utils/export.dart';

class HomeController extends GetxController {
  final WeatherRepository weatherRepository;

  HomeController({required this.weatherRepository});
  final RxBool isLoading = true.obs;
  final RxList<Weather> weatherList = <Weather>[].obs;
  final RxString errorMessage = ''.obs;

  final List<String> _cities = [
    'Ahmedabad',
    'London',
    'New York',
    'Tokyo',
    'Paris',
    'Sydney',
    'Moscow',
    'Cairo',
    'Rio de Janeiro',
    'Beijing',
    'Mumbai'
  ];
  @override
  void onInit() {
    super.onInit();
    fetchWeatherForCities();
  }
  Future<void> fetchWeatherForCities() async {
    try {
      isLoading(true);
      errorMessage('');
      final result = await weatherRepository.getWeatherForCities(_cities);
      weatherList.assignAll(result);
    } catch (e) {
      errorMessage('Failed to fetch weather data: ${e.toString()}');
    } finally {
      isLoading(false);
    }
  }

 void goToWeatherDetail(Weather weather) {
    Get.toNamed(Routes.weatherDetial, arguments: weather);
  }
}
