import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/model/movies_model.dart';
import 'package:movies/util/router_manager.dart';
import 'package:movies/view_model/locale_view_model.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class MoviesTodayView extends StatelessWidget {


  final MoviesToday today;

  MoviesTodayView(this.today);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: InkWell(
        child: _coverView,
        onTap: () {
          RouterManager.toDetail(
              context, RouterType.detail, today.movie.path, today.movie.title);
        },
      ),
    );
  }

  Widget get _coverView {

    return Row(
      children: [
        Expanded(
            child: Container(
                height: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(3.0),
                        bottomLeft: Radius.circular(3.0)),
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(today.cover),
                        fit: BoxFit.cover)))),
        Expanded(
          child: Container(
              padding: EdgeInsets.all(15),
              height: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Consumer<LocaleViewModel>(builder: (context, viewModel, _) {

                    final now = DateTime.now(),
                        languageCode = viewModel.current.languageCode,
                        day = now.day.toString(),
                        month = DateFormat.MMMM(languageCode).format(now),
                        weekday = DateFormat.EEEE(languageCode).format(now);

                    return Column(children: [
                      Text(day, style: TextStyle(fontSize: 60)),
                      Text('$month｜$weekday', style: TextStyle(fontSize: 12)),
                      Text(today.lunar, style: TextStyle(fontSize: 12)),
                    ]);
                  }),
                  Text(" \"${today.comment}\" ", style: TextStyle(fontSize: 16))
                ],
              )),
        )
      ],
    );
  }

}
