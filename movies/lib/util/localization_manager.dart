import 'package:movies/util/storage_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';

enum Language {
  zh,
  en
}

Language languageType(String name) {
  switch (name) {
    case 'en':
      return Language.en;
    default:
      return Language.zh;
  }
}

String languageName(Language language) {
  switch (language) {
    case Language.en:
      return 'English';
    default:
      return '简体中文';
  }
}

String languageFile(Language language) {
  switch (language) {
    case Language.en:
      return 'en';
    default:
      return 'zh';
  }
}

Locale languageLocal(Language language) {
  return Locale(languageFile(language));
}



class LocalizationManger {

  static FlutterI18nDelegate delegate;
  static Language language = StorageManager.language;
  static final fallbackFile = languageFile(language);
  static final forcedLocale = languageLocal(language);

  static setup() {
    delegate = FlutterI18nDelegate(
        useCountryCode: false,
        fallbackFile: fallbackFile,
        path: 'assets/i18n',
        forcedLocale: forcedLocale);
  }

  static String i18n(BuildContext context, String key) {
    return FlutterI18n.translate(context, key);
  }


}