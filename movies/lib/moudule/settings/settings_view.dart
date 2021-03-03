import 'package:movies/generated/l10n.dart';
import 'package:movies/util/constant.dart';
import 'package:movies/util/router_manager.dart';
import 'package:movies/util/storage_manager.dart';
import 'package:flutter/material.dart';

import 'package:movies/view_model/locale_view_model.dart';
import 'package:movies/view_model/theme_view_model.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final version =
        'v ${StorageManager.packageInfo.version}(${StorageManager.packageInfo.buildNumber})';

    final locale = Provider.of<LocaleViewModel>(context, listen: false).current,
        themeMode = Provider.of<ThemeViewModel>(context, listen: false).current;

    final titles = [
      S.of(context).settings_language,
      S.of(context).settings_theme,
      S.of(context).settings_about
    ];

    final subtitles = [locale.displayName, themeMode.displayName, ''];


    final actions = [
      ()=>RouterManager.toSetting(context, StorageKeys.locale),
          ()=>RouterManager.toSetting(context, StorageKeys.themeMode),
      ()=>showAboutDialog(
          context: context,
          applicationName: StorageManager.packageInfo.appName,
          applicationVersion: version,
          applicationLegalese: 'By ZzzM')];

    return Scaffold(
        appBar: AppBar(title: Text(S.of(context).settings_title)),
        body: ListView.separated(
            itemBuilder: (_, index) {

              final title = titles[index],
                  subtitle = subtitles[index],
                  action = actions[index];

              return ListTile(
                  title: Text(title),
                  subtitle: subtitle.isNotEmpty ? Text(subtitle) : null,
                  trailing: Icon(Icons.chevron_right),
                onTap: action,
              );
            },
            separatorBuilder: (_, __) => Divider(),
            itemCount: titles.length));

  }
}
