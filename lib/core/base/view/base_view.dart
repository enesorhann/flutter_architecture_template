import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class BaseView<T extends Store> extends StatefulWidget {
  final Widget Function(BuildContext context, T viewModel) onPageBuilder;
  final T viewModel;
  final Function(T viewModel)? onModelReady;
  final VoidCallback? onDispose;

  const BaseView({
    super.key,
    required this.onPageBuilder,
    required this.viewModel,
    this.onModelReady,
    this.onDispose,
  });

  @override
  State<BaseView<T>> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends Store> extends State<BaseView<T>> {
  @override
  void initState() {
    super.initState();
    widget.onModelReady?.call(widget.viewModel);
  }

  @override
  void dispose() {
    super.dispose();
    widget.onDispose?.call();
  }

  @override
  Widget build(BuildContext context) {
    return widget.onPageBuilder(context, widget.viewModel);
  }
}
