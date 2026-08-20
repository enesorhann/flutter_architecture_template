import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_app/core/constants/app/app_constants.dart';
import 'package:flutter_architecture_app/core/init/cache/preferences_manager.dart';
import 'package:flutter_architecture_app/core/init/language/language_manager.dart';
import 'package:flutter_architecture_app/core/init/navigation/navigation_route.dart';
import 'package:flutter_architecture_app/core/init/navigation/navigation_service.dart';
import 'package:flutter_architecture_app/core/init/notifier/application_provider.dart';
import 'package:flutter_architecture_app/core/init/notifier/theme_notifier.dart';
import 'package:flutter_architecture_app/view/authenticate/test/view/test_view.dart';
import 'package:provider/provider.dart';

void main() async {
  await PreferencesManager.preferencesManagerInit();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [...ApplicationProvider.instance.dependItems],
      child: EasyLocalization(
        supportedLocales: LanguageManager.instance.supportedLocales,
        path: AppConstants.localizationPath,
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeNotifier>(context).currentTheme,
      title: 'Flutter Demo',
      home: TestView(),
      navigatorKey: NavigationService.instance.navigatorKey,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
    );
  }
}
