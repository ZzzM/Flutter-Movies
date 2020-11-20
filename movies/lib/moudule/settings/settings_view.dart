
import 'package:movies/util/constant.dart';
import 'package:movies/util/localization_manager.dart';

import 'package:movies/util/router_manager.dart';
import 'package:movies/util/storage_manager.dart';
import 'package:movies/view_model/language_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:movies/view_model/theme_view_model.dart';


class SettingsView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Consumer<LanguageViewModel>(builder: (context, viewModel, _) {
      return Scaffold(
        appBar: AppBar(
            title: Text(LocalizationManger.i18n(context, 'tab.settings'))
        ),
        body: ListView(
          children: ListTile.divideTiles(
              context: context,
              tiles: [
                ListTile(
                    title: Text(LocalizationManger.i18n(context, 'settings.language')),
                    subtitle: Text(languageName(StorageManager.language)),
                    trailing: Icon(Icons.chevron_right, color: ConsColor.theme),
                    onTap: () {
                      RouterManager.toSetting(context, 'settings.language');
                    }),
                ListTile(
                    title: Text(LocalizationManger.i18n(context, 'settings.theme')),
                    subtitle: Text(LocalizationManger.i18n(context, themeKey(StorageManager.themeMode))),
                    trailing: Icon(Icons.chevron_right, color: ConsColor.theme),
                    onTap: () {
                      RouterManager.toSetting(context, 'settings.theme');
                    }),
                ListTile(
                    title: Text(LocalizationManger.i18n(context, 'settings.version')),
                    trailing: Text(
                        'v ${StorageManager.packageInfo.version}(${StorageManager.packageInfo.buildNumber})',
                        style: TextStyle(fontSize: 15))
                )
              ]
          ).toList()
        ),
      );
    });

  }


}
