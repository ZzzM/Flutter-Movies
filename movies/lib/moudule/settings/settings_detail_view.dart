import 'dart:ffi';

import 'package:movies/util/constant.dart';
import 'package:movies/util/localization_manager.dart';
import 'package:movies/util/router_manager.dart';
import 'package:movies/view_model/language_view_model.dart';
import 'package:movies/view_model/theme_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:movies/util/storage_manager.dart';

class SettingsDetailView extends StatelessWidget {

  final String type;
  SettingsDetailView(this.type);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(LocalizationManger.i18n(context, type))),
      body: ListView(
        children: ListTile.divideTiles(context: context, tiles: _tiles(context)).toList(),
      ),
    );

  }

  List<Widget> _tiles(BuildContext context) {

    List<String> titles;
    int currIndex;
    void Function(int) onTap;

    if (type == 'settings.language') {
      final values = Language.values;
      titles = values.map((v) => languageName(v)).toList();
      currIndex = values.indexOf(StorageManager.language);
      onTap = (index) {
        Provider.of<LanguageViewModel>(context, listen: false)
            .refresh(context, values[index]);
      };
    } else {
      final values = ThemeMode.values;
      titles = values.map((v) => LocalizationManger.i18n(context, themeKey(v))).toList();
      currIndex = values.indexOf(StorageManager.themeMode);
      onTap = (index) {
        Provider.of<ThemeViewModel>(context, listen: false)
            .change(values[index]);
      };
    }


    return List.generate(titles.length, (index) {

      final title = titles[index];
      final isCurrent = index == currIndex;

      return ListTile(
        title: Text(title),
        trailing: isCurrent
            ? Icon(Icons.check, color: ConsColor.theme)
            : null,
        onTap: () {
          if (!isCurrent) {
            onTap(index);
          }
          RouterManager.pop(context);
        },
      );

    });

  }



}
