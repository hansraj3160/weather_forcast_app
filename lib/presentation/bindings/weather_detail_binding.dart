

import '../../common/utils/export.dart';

class WeatherDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WeatherDetailController>(() => WeatherDetailController());
  }
}
