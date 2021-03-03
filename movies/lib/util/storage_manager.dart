
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';


class StorageManager {

  static SharedPreferences prefs;
  static PackageInfo packageInfo;

  static Future setup() async {
    prefs = await SharedPreferences.getInstance();
    packageInfo = await PackageInfo.fromPlatform();
  }

  static setInt(String key, int value) => prefs.setInt(key, value);

  static getInt(String key) => prefs.getInt(key);

  // static set local(Locale _locale) {
  //   prefs.setInt(StorageKey.local, _locale.index);
  // }
  //
  // static Locale get local => LocalizationManger.supportedLocales[prefs.getInt(StorageKey.local) ?? 0];
  //
  //
  // static set themeMode(ThemeMode _mode) {
  //   prefs.setInt(StorageKey.themeMode, _mode.index);
  // }
  //
  // static ThemeMode get themeMode => ThemeMode.values[prefs.getInt(StorageKey.themeMode) ?? 0];

}