import 'package:flutter/material.dart';
import 'package:flutter_architecture_app/core/constants/enums/theme_enums.dart';
import 'package:flutter_architecture_app/core/init/notifier/theme_notifier.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

part 'test_view_model.g.dart';

class TestViewModel = _TestViewModelBase with _$TestViewModel;

abstract class _TestViewModelBase with Store {
  late BuildContext viewContext;

  void setContext(BuildContext context) {
    viewContext = context;
  }

  @observable
  int number = 0;

  @computed
  bool get isEven => number % 2 == 0;

  @action
  void increment() {
    number++;
  }

  void changeTheme() {
    Provider.of<ThemeNotifier>(
      viewContext,
      listen: false,
    ).updateTheme(ThemeEnums.DARK);
  }
}
