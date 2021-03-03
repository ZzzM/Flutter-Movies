import 'package:flutter/material.dart';
import 'package:movies/generated/l10n.dart';
import 'package:movies/util/util.dart';
import '../base_view.dart';

class MovieSummaryView extends StatelessWidget {

  final String summary;

  MovieSummaryView(this.summary);

  @override
  Widget build(BuildContext context) {
    if (summary.isNotEmpty) {
      return Container(
          width: screenWidth(context),
          padding: EdgeInsets.only(left: 15, right:15, top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              BaseTitleView(S.of(context).movie_summary),
              Text(summary,
                  style: TextStyle(color: Colors.white, fontSize: 13))
            ],
          ));
    }
    return SizedBox();
  }
}
