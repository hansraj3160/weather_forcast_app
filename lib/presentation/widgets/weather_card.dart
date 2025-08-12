import 'dart:ui';

import '../../common/utils/export.dart';
import '../controllers/theme_controller.dart';

class WeatherCard extends StatelessWidget {
  final Weather weather;
  final VoidCallback onTap;

  const WeatherCard({
    super.key,
    required this.weather,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);
    final themeController = Get.find<ThemeController>();
    final isDarkMode = themeController.isDarkMode;

    Widget cardContent = Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isDarkMode
            ? theme.colorScheme.surface.withValues(alpha: 0.1)
            : theme.colorScheme.surface,
        border: isDarkMode
            ? Border.all(color: Colors.white.withValues(alpha: 0.2), width: 1)
            : null,
        boxShadow: isDarkMode
            ? null
            : [
                BoxShadow(
                  color: Colors.grey.withValues(alpha:0.2),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
      ),
      child: Row(
        children: [
          Image.network(
            'https://openweathermap.org/img/wn/${weather.iconCode}@2x.png',
            width: 50,
            height: 50,
            errorBuilder: (context, error, stackTrace) =>
                Icon(Icons.cloud_queue, size: 40, color: theme.iconTheme.color),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  weather.cityName,
                  style: theme.textTheme.bodyLarge
                      ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 2),
                Text(
                  weather.mainCondition,
                  style: theme.textTheme.bodyMedium?.copyWith(fontSize: 14),
                ),
              ],
            ),
          ),
          Text(
            '${weather.temperature.toStringAsFixed(0)}°',
            style: theme.textTheme.bodyLarge
                ?.copyWith(fontSize: 25, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );

    return GestureDetector(
      onTap: onTap,
   
      child: isDarkMode
          ? ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: cardContent,
              ),
            )
          : cardContent,
    );
  }
}
