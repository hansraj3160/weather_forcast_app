
import 'package:http/http.dart' as http;

import '../../common/utils/export.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<http.Client>(() => http.Client());
    
    Get.lazyPut<RemoteDataSource>(
      () => RemoteDataSourceImpl(client: Get.find()),
    );
    
    Get.lazyPut<WeatherRepository>(
      () => WeatherRepositoryImpl(remoteDataSource: Get.find()),
    );
    
    Get.lazyPut<HomeController>(
      () => HomeController(weatherRepository: Get.find()),
    );
  }
}
