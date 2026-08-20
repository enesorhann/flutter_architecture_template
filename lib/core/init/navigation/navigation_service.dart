import 'package:flutter/material.dart';
import 'package:flutter_architecture_app/core/init/navigation/INavigationService.dart';

// EAGER SINGLETON
class NavigationService implements Inavigationservice {
  static final NavigationService _instance = NavigationService._init();
  static NavigationService get instance => _instance;

  NavigationService._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Future<void> navigateToPath({
    required String path,
    required Object data,
  }) async {
    navigatorKey.currentState?.pushNamed(path, arguments: data);
  }

  @override
  Future<void> navigateToPathClear({
    required String path,
    required Object data,
  }) async {
    navigatorKey.currentState?.pushNamedAndRemoveUntil(
      path,
      (route) => false,
      arguments: data,
    );
  }
}
