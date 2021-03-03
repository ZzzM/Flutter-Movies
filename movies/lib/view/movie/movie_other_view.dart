import 'package:movies/generated/l10n.dart';
import 'package:movies/model/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:movies/util/router_manager.dart';

import '../base_view.dart';

class MovieOtherView extends StatelessWidget {
  final Movie movie;

  MovieOtherView(this.movie);

  @override
  Widget build(BuildContext context) {
    final types = [RouterType.photos, RouterType.comments, RouterType.reviews];
    final titles = [
      S.of(context).movie_photos,
      S.of(context).movie_comments,
      S.of(context).movie_review];

    return Container(
        child: Column(
          children: List.generate(types.length, (index) {
            final type = types[index], title = titles[index];
            return ListTile(
                title: BaseTitleView(title),
                trailing: Icon(Icons.chevron_right, color: Colors.white),
                onTap: () {
                  RouterManager.toDetail(context, type, movie.path, movie.title);
                });

          }),
        ));
  }
}
