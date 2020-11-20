import 'package:flutter/material.dart';
import '../base_view.dart';

class MovieSummaryView extends StatelessWidget {

  final String summary;

  MovieSummaryView(this.summary);

  @override
  Widget build(BuildContext context) {
    if (summary.isNotEmpty) {
      return Container(
          padding: EdgeInsets.only(left: 15, right:15, top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              BaseTitleView('movie.summary'),
              Text(summary,
                  style: TextStyle(color: Colors.white, fontSize: 13))
            ],
          ));
    }
    return SizedBox();
  }
}
