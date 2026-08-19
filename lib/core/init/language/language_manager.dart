import 'package:flutter/material.dart';

// LAZY SINGLETON
class LanguageManager {
  static LanguageManager? _instance;
  static LanguageManager get instance => _instance ??= LanguageManager._init();

  LanguageManager._init();

  final localeEn = Locale('en', 'US');
  final localeTr = Locale('tr', 'TR');

  List<Locale> get supportedLocales => [localeEn, localeTr];
}
