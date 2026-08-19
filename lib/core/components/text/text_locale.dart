import 'package:flutter/material.dart';
import 'package:flutter_architecture_app/core/init/extension/string_extension.dart';

class TextLocale extends StatelessWidget {
  final String text;
  const TextLocale({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text.locale);
  }
}
