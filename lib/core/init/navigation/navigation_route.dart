import 'package:flutter/material.dart';
import 'package:flutter_architecture_app/core/components/card/not_found.dart';
import 'package:flutter_architecture_app/core/constants/navigation/navigation_constants.dart';
import 'package:flutter_architecture_app/view/authenticate/test/view/test_view.dart';

// EAGER SINGLETON
class NavigationRoute {
  static NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.testView:
        return normalNavigate(widget: TestView());
      default:
        return normalNavigate(widget: NotFound());
    }
  }

  MaterialPageRoute<dynamic> normalNavigate({required Widget widget}) =>
      MaterialPageRoute(builder: (context) => widget);
}
