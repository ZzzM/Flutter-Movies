import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderView<T extends ChangeNotifier> extends StatefulWidget {
  final ValueWidgetBuilder<T> builder;
  final T viewModel;
  final Widget child;

  ProviderView({
    Key key,
    @required this.builder,
    @required this.viewModel,
    this.child,
  }) : super(key: key);

  @override
  _ProviderViewState<T> createState() => _ProviderViewState<T>();
}

class _ProviderViewState<T extends ChangeNotifier>
    extends State<ProviderView<T>> {
  T viewModel;

  @override
  void initState() {
    viewModel = widget.viewModel;

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
        value: viewModel,
        child: Consumer<T>(
          builder: widget.builder,
          child: widget.child,
        ));
  }
}