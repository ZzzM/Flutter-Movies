
import 'package:movies/util/util.dart';
import 'package:movies/view_model/language_view_model.dart';
import 'package:movies/view_model/theme_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => ThemeViewModel()),
  ChangeNotifierProvider(create: (_) => LanguageViewModel())
];


class ConsColor {
  static final theme = hexColor('#52BE80');
  static final border = hexColor('#657271');
}

class BaseUrl {

  static const v1 = '';
  static const v2 = '';


}









