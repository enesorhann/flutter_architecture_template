import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_app/core/base/state/base_state.dart';
import 'package:flutter_architecture_app/core/base/view/base_view.dart';
import 'package:flutter_architecture_app/core/init/extension/string_extension.dart';
import 'package:flutter_architecture_app/core/init/language/language_manager.dart';
import 'package:flutter_architecture_app/core/init/language/locale_keys.g.dart';
import 'package:flutter_architecture_app/view/authenticate/test/view_model/test_view_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TestView extends StatefulWidget {
  const TestView({super.key});

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends BaseState<TestView> {
  late TestViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<TestViewModel>(
      viewModel: TestViewModel(),
      onPageBuilder: (context, viewModel) => scaffoldBody,
      onModelReady: (model) {
        viewModel = model;
      },
    );
  }

  Widget get scaffoldBody => Scaffold(
    appBar: AppBar(title: textLocale(), actions: [changeLocaleButton()]),
    body: textNumber,
    floatingActionButton: FloatingActionButton(
      onPressed: () => viewModel.increment(),
      child: const Icon(Icons.add),
    ),
  );

  Text textLocale() => Text(LocaleKeys.welcome.locale);

  IconButton changeLocaleButton() {
    return IconButton(
      onPressed: () {
        context.setLocale(LanguageManager.instance.localeEn);
      },
      icon: const Icon(Icons.language),
    );
  }

  Widget get textNumber => Observer(
    builder: (_) => Center(
      child: Text(
        viewModel.number.toString(),
        style: const TextStyle(fontSize: 50),
      ),
    ),
  );
}
