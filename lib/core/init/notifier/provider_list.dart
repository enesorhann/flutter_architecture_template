import 'package:flutter_architecture_app/core/init/navigation/navigation_service.dart';
import 'package:flutter_architecture_app/core/init/notifier/theme_notifier.dart';
import 'package:flutter_architecture_app/core/init/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

// LAZY SINGLETON
class ProviderList extends AppTheme {
  static ProviderList? _instance;
  static ProviderList get instance => _instance ??= ProviderList._init();

  ProviderList._init();

  List<SingleChildWidget> dependItems = [
    ChangeNotifierProvider<ThemeNotifier>(create: (_) => ThemeNotifier()),
    Provider.value(value: NavigationService.instance),
  ];
}
