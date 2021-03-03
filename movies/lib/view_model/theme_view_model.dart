import 'package:movies/generated/l10n.dart';
import 'package:movies/util/constant.dart';
import 'package:movies/util/storage_manager.dart';
import 'package:flutter/material.dart';


ThemeData lightData = ThemeData.light().copyWith(
    primaryColor: ConsColor.theme,
    appBarTheme: AppBarTheme(
      color: Colors.white,
      textTheme: TextTheme(
        headline6: TextStyle(color: ConsColor.theme,
            fontSize: 20)
      ),
      iconTheme: IconThemeData(
        color: ConsColor.theme
      ),
      brightness: Brightness.light,
    //  elevation: 0
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: Colors.grey.shade400,
    )
);

ThemeData darkData = ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
    //  elevation: 0,
      textTheme: TextTheme(
          headline6: TextStyle(color: Colors.white,
              fontSize: 20)
      ),
      iconTheme: IconThemeData(
          color: Colors.white
      ),
    ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    unselectedItemColor: Colors.grey.shade600,
  )
);

extension ThemeModeExtension on ThemeMode {
  String get displayName {
    switch (this) {
      case ThemeMode.dark: return S.current.settings_theme_dark;
      case ThemeMode.light: return S.current.settings_theme_light;
      default: return S.current.settings_theme_system;
    }
  }
}

class ThemeViewModel extends ChangeNotifier {

  ThemeMode get current => ThemeMode.values[_index];

  int get _index => StorageManager.getInt(StorageKeys.themeMode) ?? 0;

  update(ThemeMode mode) {
    StorageManager.setInt(StorageKeys.themeMode, mode.index);
    notifyListeners();
  }

  updateByIndex(int index) {
    final mode = ThemeMode.values[index];
    update(mode);
  }

}