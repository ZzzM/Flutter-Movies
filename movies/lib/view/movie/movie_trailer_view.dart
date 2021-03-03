import 'package:cached_network_image/cached_network_image.dart';
import 'package:movies/generated/l10n.dart';
import 'package:movies/model/movie_model.dart';
import 'package:movies/view/player_view.dart';
import 'package:flutter/material.dart';

import '../base_view.dart';


class MovieTrailerView extends StatelessWidget {

  final Movie movie;

  MovieTrailerView(this.movie);

  @override
  Widget build(BuildContext context) {

    final trailer = movie.trailer;

    if (trailer != null) {
      return Container(
          padding: EdgeInsets.only(left: 15, right:15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              BaseTitleView(S.of(context).movie_trailers),
              Container(
                  margin: EdgeInsets.only(top: 5),
                  height: 180,
                  child: Container(
                    child: GestureDetector(
                      onTap: () {
                        PlayerView.open(context, trailer.video, title: trailer.id);
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        fit: StackFit.expand,
                        children: <Widget>[
                          CachedNetworkImage(imageUrl: trailer.cover, fit: BoxFit.cover),
                          Icon(Icons.play_circle_filled, size: 50, color: Colors.white)
                        ],
                      ),
                    ),
                  )
              )
            ],
          ));
    }
    return SizedBox();

  }

}
