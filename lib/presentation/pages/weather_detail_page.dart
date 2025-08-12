
import 'package:weather_forecast_app/common/utils/export.dart';

import '../controllers/theme_controller.dart';


class WeatherDetailPage extends GetView<WeatherDetailController> {
  const WeatherDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final isDarkMode = themeController.isDarkMode;
    final theme = Theme.of(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Obx(() => Text(controller.weather.value?.cityName ?? 'Details')),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isDarkMode
                ? [AppColors.primaryDark, AppColors.backgroundDark]
                : [AppColors.primaryLight, AppColors.backgroundLight],
          ),
        ),
        child: Obx(() {
          final weather = controller.weather.value;
          if (weather == null) {
            return Center(
                child: Text('No weather data available.',
                    style: theme.textTheme.bodyMedium));
          }
          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (isDarkMode) const SizedBox(height: 40),
                  Image.network(
                    controller.getWeatherIconUrl(weather.iconCode),
                    width: 120,
                    height: 120,
                    errorBuilder: (context, error, stackTrace) => Icon(
                        Icons.cloud_off,
                        size: 120,
                        color: theme.iconTheme.color),
                  ).animate().scale(duration: 600.ms, curve: Curves.elasticOut),
                  const SizedBox(height: 16),
                  Text(
                    '${weather.temperature.toStringAsFixed(1)}°C',
                    style: theme.textTheme.bodyLarge
                        ?.copyWith(fontSize: 60, fontWeight: FontWeight.bold),
                  ).animate().fadeIn(delay: 200.ms, duration: 500.ms).slideY(begin: 1),
                  Text(
                    'Feels like ${weather.feelsLike.toStringAsFixed(1)}°C',
                    style: theme.textTheme.bodyMedium?.copyWith(fontSize: 18),
                  ).animate().fadeIn(delay: 300.ms, duration: 500.ms).slideY(begin: 1),
                  Text(
                    weather.mainCondition,
                    style: theme.textTheme.bodyLarge
                        ?.copyWith(fontSize: 22, fontWeight: FontWeight.w500),
                  ).animate().fadeIn(delay: 400.ms, duration: 500.ms).slideY(begin: 1),
                  const SizedBox(height: 24),
                  Divider(color: isDarkMode? AppColors.white30 : Colors.grey.shade300),
                  const SizedBox(height: 16),
                  GridView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 1.8,
                    ),
                    children: [
                      DetailItem(
                          icon: Icons.water_drop_outlined,
                          label: 'Humidity',
                          value: '${weather.humidity}%'),
                      DetailItem(
                          icon: Icons.air,
                          label: 'Wind Speed',
                          value: '${weather.windSpeed} m/s'),
                      DetailItem(
                          icon: Icons.compress_outlined,
                          label: 'Pressure',
                          value: '${weather.pressure} hPa'),
                      DetailItem(
                          icon: Icons.visibility_outlined,
                          label: 'Visibility',
                          value: '${weather.visibility / 1000} km'),
                    ],
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
