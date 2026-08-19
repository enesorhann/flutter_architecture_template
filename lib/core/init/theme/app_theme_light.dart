import 'package:flutter/material.dart';
import 'package:flutter_architecture_app/core/init/theme/app_theme.dart';

// LAZY SINGLETON
class AppThemeLight extends AppTheme {
  static AppThemeLight? _instance;
  static AppThemeLight get instance => _instance ??= AppThemeLight._init();

  AppThemeLight._init();

  @override
  ThemeData get theme => ThemeData.light();
}
