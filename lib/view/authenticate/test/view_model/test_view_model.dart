import 'package:flutter/material.dart';
import 'package:flutter_architecture_app/core/base/view_model/base_view_model.dart';
import 'package:flutter_architecture_app/core/constants/enums/theme_enums.dart';
import 'package:flutter_architecture_app/core/init/network/network_manager.dart';
import 'package:flutter_architecture_app/core/init/notifier/theme_notifier.dart';
import 'package:flutter_architecture_app/view/authenticate/test/model/test_model.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

part 'test_view_model.g.dart';

class TestViewModel = _TestViewModelBase with _$TestViewModel;

abstract class _TestViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) {
    this.context = context;
  }

  void init() {}

  @observable
  bool isLoading = false;

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
      context,
      listen: false,
    ).updateTheme(ThemeEnums.DARK);
  }

  @action
  void getDioSample() async {
    isLoading = true;
    await NetworkManager.instance.getDio("test", TestModel());
    isLoading = false;
  }
}
