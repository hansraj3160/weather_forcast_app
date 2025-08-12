 
import '../../common/utils/export.dart';
import '../controllers/theme_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
     final ThemeController themeController = Get.find();


    return Scaffold(
      
      body: Obx(()=>
          Container(
          decoration:   BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            colors: themeController.isDarkMode
                    ? [AppColors.primaryDark, AppColors.backgroundDark]
                    : [AppColors.primaryLight, AppColors.backgroundLight],
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: AppBar(
                    title:  Text(AppString.homeTitle,
                        style: TextStyle(
                            color:themeController.isDarkMode? Colors.white:Colors.black, fontWeight: FontWeight.bold)),
                    centerTitle: true,
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    foregroundColor:AppColors.white,
                    actions: [
                    IconButton(
                        icon: Icon(themeController.isDarkMode
                            ? Icons.light_mode_outlined
                            : Icons.dark_mode_outlined),
                        onPressed: () {
                          themeController.switchTheme();
                        },
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Obx(() {
                    if (controller.isLoading.value) {
                      return const Center(
                          child: CircularProgressIndicator(color:AppColors.white));
                    }
        
                    if (controller.errorMessage.isNotEmpty) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            controller.errorMessage.value,
                            textAlign: TextAlign.center,
                            style:  TextStyle(
                                color: AppColors.white70, fontSize: 16),
                          ),
                        ),
                      );
                    }
        
                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: controller.weatherList.length,
                      itemBuilder: (context, index) {
                        final weather = controller.weatherList[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: WeatherCard(
                            weather: weather,
                            onTap: () => controller.goToWeatherDetail(weather),
                          ),
                        ).animate().fadeIn(delay: (150 * index).ms, duration: 600.ms).slideX(begin: -1, curve: Curves.easeOut);
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
