

import '../../common/utils/export.dart';

class WeatherDetailController extends GetxController {
 final Rx<Weather?> weather = Rx<Weather?>(null);

  @override
  void onInit() {
    super.onInit();
   final arguments = Get.arguments;
    if (arguments is Weather) {
      weather.value = arguments;
    }
  }

  String getWeatherIconUrl(String iconCode) {
    return 'https://openweathermap.org/img/wn/$iconCode@4x.png';
  }
}
