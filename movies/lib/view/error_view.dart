import 'package:movies/util/localization_manager.dart';
import 'package:movies/util/util.dart';
import 'package:flutter/material.dart';


class ErrorView extends StatelessWidget {

  String message;
  VoidCallback onRefresh;

  ErrorView(this.message, {this.onRefresh});

  @override
  Widget build(BuildContext context) {

    final _themeData = themeData(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(LocalizationManger.i18n(context, message),
              style: TextStyle(fontSize: 15), textAlign: TextAlign.center),
          SizedBox(height: 15),
          onRefresh != null ?
          RaisedButton(
            color: _themeData.primaryColor,
            child: Text(LocalizationManger.i18n(context, 'refresh.reload'),
                style: TextStyle(color: Colors.white)),
            onPressed: onRefresh,
          ) : SizedBox()
        ],
      ),
    );
  }
}