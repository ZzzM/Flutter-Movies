import 'package:movies/generated/l10n.dart';
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
          Text(message,
              style: TextStyle(fontSize: 15), textAlign: TextAlign.center),
          SizedBox(height: 15),
          onRefresh != null ?
          RaisedButton(
            color: _themeData.primaryColor,
            child: Text(S.of(context).refresh_reload,
                style: TextStyle(color: Colors.white)),
            onPressed: onRefresh,
          ) : SizedBox()
        ],
      ),
    );
  }
}