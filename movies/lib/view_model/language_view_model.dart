import 'package:movies/util/localization_manager.dart';
import 'package:movies/util/storage_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class LanguageViewModel extends ChangeNotifier {

  refresh(BuildContext context, Language language) async {
    StorageManager.language = language;
    FlutterI18n.refresh(context, languageLocal(language));
    notifyListeners();
  }

}