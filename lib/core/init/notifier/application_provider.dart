import 'package:flutter_architecture_app/core/init/navigation/navigation_service.dart';
import 'package:flutter_architecture_app/core/init/notifier/theme_notifier.dart';
import 'package:flutter_architecture_app/core/init/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

// LAZY SINGLETON
class ApplicationProvider extends AppTheme {
  static ApplicationProvider? _instance;
  static ApplicationProvider get instance =>
      _instance ??= ApplicationProvider._init();

  ApplicationProvider._init();

  List<SingleChildWidget> dependItems = [
    ChangeNotifierProvider<ThemeNotifier>(create: (_) => ThemeNotifier()),
    Provider.value(value: NavigationService.instance),
  ];
}
