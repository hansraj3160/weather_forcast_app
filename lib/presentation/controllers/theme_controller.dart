import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  final _box = GetStorage();
  final _key = 'isDarkMode';

  final RxBool _isDarkMode = false.obs;
  bool get isDarkMode => _isDarkMode.value;
  ThemeMode get theme => _isDarkMode.value ? ThemeMode.dark : ThemeMode.light;
  @override
  void onInit() {
    super.onInit();
    _isDarkMode.value = _loadThemeFromBox();
  }
  bool _loadThemeFromBox() => _box.read(_key) ?? false;
  void _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);
  void switchTheme() {
    _isDarkMode.value = !_isDarkMode.value;
    Get.changeThemeMode(theme);
    _saveThemeToBox(_isDarkMode.value);
  }
}
