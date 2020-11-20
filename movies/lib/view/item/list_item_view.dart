import 'package:cached_network_image/cached_network_image.dart';
import 'package:movies/view/rating_view.dart';
import 'package:movies/model/movie_model.dart';

import 'package:movies/util/localization_manager.dart';
import 'package:movies/view_model/language_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ListItemView extends StatelessWidget {

  final MovieListItem item;
  final VoidCallback onTap;

  ListItemView(
    this.item,
    this.onTap
  );


  bool get _isMovieItem => item.directors != null;

  @override
  Widget build(BuildContext context) {

    return Card(
        child: InkWell(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Row(
              children: <Widget>[
                _imageView,
                _titleView,
                _ratingView(context)],
            ),
          ),
        ));
  }

  get _imageView {
    return Container(
        width: 80,
        margin: EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.0),
            image: DecorationImage(
                image: CachedNetworkImageProvider(item.cover),
                fit: BoxFit.fill)));
  }

  get _titleView {
    return Expanded(
      child: Column(
        mainAxisAlignment: _isMovieItem ? MainAxisAlignment.start:MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            item.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5, bottom: 5),
            child: Text(
              '${item.year}.${item.release_date}',
              maxLines: 1,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          Text(
            item.genre,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 13,
            ),
          ),
          _isMovieItem ?
          Text(
            "${item.directors.join(" / ")}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 13),
          ):
          item.description.isNotEmpty ?
          Text("\"${item.description}\"",
              maxLines: 2,
              style: TextStyle(color: Colors.grey),
              overflow: TextOverflow.ellipsis):
          SizedBox(),
          _isMovieItem ?
          Text(
            "${item.actors.join(" / ")}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 13),
          ):
          SizedBox()
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }

  Widget _ratingView(BuildContext context) {
    return Container(
      width: 80,
      child: Column(children: <Widget>[
        RatingScoreView(item.rating.value.toString(),
            normalSize: 24, noneSize: 15, noneColor: Colors.grey),
        RatingStarView(
            item.rating.fullCount,
            Icon(Icons.star, size: 16, color: Colors.amberAccent),
            item.rating.emptyCount,
            Icon(Icons.star_border, size: 16, color: Colors.amberAccent),
            halfCount: item.rating.halfCount,
            halfIcon:
            Icon(Icons.star_half, size: 16, color: Colors.amberAccent)),
        Consumer<LanguageViewModel>(builder: (context, _, child) {
          return Text(
            "${item.rating.count}${LocalizationManger.i18n(context, 'movie.scored')}",
            style: TextStyle(
              fontSize: 10,
            ),
          );
        })

      ],
          mainAxisAlignment: MainAxisAlignment.spaceEvenly),
    );
  }
}
