import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:movies/generated/l10n.dart';
import 'package:movies/util/constant.dart';
import 'package:movies/util/router_manager.dart';
import 'package:movies/view_model/locale_view_model.dart';
import 'package:movies/view_model/theme_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SettingsDetailView extends StatelessWidget {

  final String type;
  SettingsDetailView(this.type);

  bool get _localeSetting => StorageKeys.locale == type;

  List<dynamic> get _options {
    if (_localeSetting) {
      return S.delegate.supportedLocales;
    }
    return ThemeMode.values;
  }

  dynamic _viewModel(BuildContext context) {
    if (_localeSetting) {
      return Provider.of<LocaleViewModel>(context, listen: false);
    }
    return Provider.of<ThemeViewModel>(context, listen: false);
  }

  List<String> get _titles {
    if (_localeSetting) {
      return _options.map((v) => (v as Locale).displayName).toList();
    }
    return _options.map((v) => (v as ThemeMode).displayName).toList();

  }

  String _title(BuildContext context) {
    if (_localeSetting) {
      return S.of(context).settings_language;
    }
    return S.of(context).settings_theme;
  }

  int _curr(BuildContext context) {

    return _options.indexOf(_viewModel(context).current);

  }

  _action(BuildContext context, int index) {
    _viewModel(context).updateByIndex(index);
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: Text(_title(context))),
      body: AnimationLimiter(
        child: ListView.separated(
            itemBuilder: (context, index) {

              final title = _titles[index],
                  isSelected = _curr(context) == index;

              return AnimationConfiguration.staggeredList(
                duration: const Duration(milliseconds: 500),
                  position: index,
                  child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: ListTile(
                          title: Text(title),
                          trailing: isSelected ? Icon(Icons.check, color: ConsColor.theme) : null,
                          onTap: (){
                            if (!isSelected) {
                              RouterManager.pop(context);
                              _action(context, index);
                            }
                          },
                        ),
                      )
                  )
              );
            },
            separatorBuilder: (_, __) => Divider(),
            itemCount: _titles.length),
      )
    );

  }


}
