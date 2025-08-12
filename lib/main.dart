import 'package:get_storage/get_storage.dart';

import 'common/styles/app_theme.dart';
import 'common/utils/export.dart';
import 'presentation/controllers/theme_controller.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());
    return 
      GetMaterialApp(
        title: AppString.appName,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: themeController.theme,
        initialRoute: AppPages.initail,
        getPages: AppPages.routes,
        initialBinding: HomeBinding(),
        debugShowCheckedModeBanner: false,
      
    );
  }
}
