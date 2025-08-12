import 'dart:ui';
 
import '../../common/utils/export.dart';
import '../controllers/theme_controller.dart';

class DetailItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const DetailItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeController = Get.find<ThemeController>();
    final isDarkMode = themeController.isDarkMode;

    Widget cardContent = Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isDarkMode
            ? theme.colorScheme.surface.withValues(alpha:0.1)
            : theme.colorScheme.surface,
        border: isDarkMode
            ? Border.all(
                color: Colors.white.withValues(alpha:0.2),
                width: 1,
              )
            : null,
        boxShadow: isDarkMode
            ? null
            : [
                BoxShadow(
                  color: Colors.grey.withValues(alpha:0.15),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: theme.iconTheme.color, size: 20),
              const SizedBox(width: 8),
              Text(label, style: theme.textTheme.bodyMedium),
            ],
          ),
          const SizedBox(height: 8),
          Text(value,
              style: theme.textTheme.bodyLarge
                  ?.copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
        ],
      ),
    );

    return (isDarkMode
            ? ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: cardContent,
                ),
              )
            : cardContent)
        .animate()
        .fadeIn(duration: 500.ms)
        .slideY(begin: 0.5, curve: Curves.easeOut);
  }
}
