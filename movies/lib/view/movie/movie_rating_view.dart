import 'package:movies/generated/l10n.dart';
import 'package:movies/model/movie_model.dart';
import 'package:flutter/material.dart';

import '../rating_view.dart';

class MovieRatingView extends StatelessWidget {

  final Movie movie;

  MovieRatingView(this.movie);

  Widget _textView(String text) {
    return Text(text,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 12, color: Colors.white));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white10, borderRadius: BorderRadius.circular(5)),
      height: 150,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RatingScoreView(movie.rating.value.toString(),
                    normalSize: 25, noneSize: 15, normalColor: Colors.white),
                RatingStarView(
                  movie.rating.fullCount,
                  Icon(Icons.star, size: 20, color: Colors.amberAccent),
                  movie.rating.emptyCount,
                  Icon(Icons.star_border, size: 20, color: Colors.amberAccent),
                  halfCount: movie.rating.halfCount,
                  halfIcon: Icon(Icons.star_half,
                      size: 20, color: Colors.amberAccent),
                ),
                Text(
                    '${movie.rating.count} ${S.of(context).movie_scored}',
                    style: TextStyle(fontSize: 10, color: Colors.white))
              ],
            ),
          ),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _textView(
                      '${S.of(context).movie_release}：${movie.released ? movie.pubdate : S.of(context).movie_unrelease}'),
                  _textView('${S.of(context).movie_genre}：${movie.genres}'),
                  _textView('${S.of(context).movie_duration}：${movie.durations}'),
                  _textView('${S.of(context).movie_region}：${movie.countries}'),
                  _textView('${S.of(context).movie_language}：${movie.languages}'),
                ],
              ))
        ],
      ),
    );
  }
}