import 'package:flutter/services.dart';
import 'package:movies/util/constant.dart';
import 'package:movies/util/router_manager.dart';
import 'package:movies/util/storage_manager.dart';
import 'package:movies/view_model/locale_view_model.dart';
import 'package:movies/view_model/theme_view_model.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'generated/l10n.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await StorageManager.setup().then((_) {

    RouterManager.setup();
    runApp(MovieApp());
    Permission.storage.request();

  });


}

class MovieApp extends StatefulWidget {
  @override
  _MovieAppState createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {


  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);


    return MultiProvider(
        providers: providers,
        child: Consumer2<ThemeViewModel, LocaleViewModel>(
          builder: (context, viewModel1, viewModel2, widget) {

            return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: lightData,
                darkTheme: darkData,
                themeMode: viewModel1.current,
                initialRoute: '/',
                onGenerateRoute: RouterManager.router.generator,
                localizationsDelegates: [
                  S.delegate,
                  RefreshLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate
                ],
              supportedLocales: S.delegate.supportedLocales,
              locale: viewModel2.current,
            );
          },
        )
    );
  }
}



