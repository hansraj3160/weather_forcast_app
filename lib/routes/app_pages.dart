

import '../common/utils/export.dart';

part 'app_routes.dart';

class AppPages {
  static const initail = Routes.home;

  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.weatherDetial,
      page: () => const WeatherDetailPage(),
      binding: WeatherDetailBinding(),
    ),
  ];
}
