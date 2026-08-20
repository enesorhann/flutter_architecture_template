// LAZY SINGLETON
import 'package:flutter_architecture_app/core/constants/enums/preferences_enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesManager {
  SharedPreferences? preferences;

  static PreferencesManager _instance = PreferencesManager._init();
  static PreferencesManager get instance => _instance;

  PreferencesManager._init();

  static preferencesManagerInit() async {
    _instance.preferences ??= await SharedPreferences.getInstance();
  }

  Future<void> setStringValue({
    required PreferencesEnums prefKey,
    required String value,
  }) async {
    await preferences?.setString(prefKey.toString(), value);
  }

  String getStringValue({required PreferencesEnums prefKey}) {
    return preferences?.getString(prefKey.toString()) ?? "";
  }
}
