import 'package:movies/generated/l10n.dart';
import 'package:movies/util/constant.dart';
import 'package:movies/util/storage_manager.dart';
import 'package:flutter/cupertino.dart';

class LocaleViewModel extends ChangeNotifier {

  Locale get current => S.delegate.supportedLocales[_index];

  int get _index => StorageManager.getInt(StorageKeys.locale) ?? 1;

  update(Locale locale) {
    S.load(locale);
    StorageManager.setInt(StorageKeys.locale, locale.index);
    notifyListeners();
  }

  updateByIndex(int index) {
    final locale = S.delegate.supportedLocales[index];
    update(locale);
  }

}

extension LocaleExtension on Locale {

  String get displayName {
    switch (languageCode) {
      case 'en': return 'English';
      default: return '简体中文';
    }
  }

  int get index {
    return S.delegate.supportedLocales.indexOf(this);
  }

}