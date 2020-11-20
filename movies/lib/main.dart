
import 'package:flutter/services.dart';
import 'package:movies/util/constant.dart';
import 'package:movies/util/localization_manager.dart';
import 'package:movies/util/router_manager.dart';
import 'package:movies/util/storage_manager.dart';
import 'package:movies/view_model/theme_view_model.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await StorageManager.setup().then((_) {

    LocalizationManger.setup();
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

  Widget _home;

  @override
  void initState() {
    setState(() {
      _home = TestView();
    });
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MultiProvider(
        providers: providers,
        child: Consumer<ThemeViewModel>(
          builder: (context, _, widget) {

            return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: lightData,
                darkTheme: darkData,
                themeMode: StorageManager.themeMode,
                initialRoute: '/',
                onGenerateRoute: RouterManager.router.generator,
                localizationsDelegates: [
                  LocalizationManger.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate
                ]
            );
          },
        )
    );
  }
}

class TestView extends StatefulWidget {
  @override
  _TestViewState createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  @override
  Widget build(BuildContext context) {
    print('TestView');
    return Container(
      color: Colors.blue,
    );
  }
}



