import 'package:flutter/material.dart';

mixin BaseViewModel {
  late BuildContext viewContext;

  void setContext(BuildContext context);

  void init();
}
