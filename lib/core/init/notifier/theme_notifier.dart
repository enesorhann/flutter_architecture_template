import 'package:flutter/material.dart';
import 'package:flutter_architecture_app/core/constants/enums/theme_enums.dart';
import 'package:flutter_architecture_app/core/init/theme/app_theme_light.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _themeData = AppThemeLight.instance.theme;
  ThemeData get currentTheme => _themeData;

  void updateTheme(ThemeEnums themeEnums) {
    switch (themeEnums) {
      case ThemeEnums.LIGHT:
        _themeData = ThemeData.light();
        break;
      case ThemeEnums.DARK:
        _themeData = ThemeData.dark();
        break;
    }
    notifyListeners();
  }
}
