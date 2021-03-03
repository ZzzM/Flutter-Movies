import 'package:movies/generated/l10n.dart';
import 'package:movies/util/util.dart';
import 'package:movies/view/error_view.dart';
import 'package:movies/view/movie/movie_cover_view.dart';
import 'package:movies/view/movie/movie_other_view.dart';
import 'package:movies/view/movie/movie_rating_view.dart';

import 'package:movies/view/movie/movie_staff_view.dart';
import 'package:movies/view/movie/movie_summary_view.dart';
import 'package:movies/view/movie/movie_trailer_view.dart';
import 'package:movies/view/provider_view.dart';
import 'package:movies/view/refresh_view.dart';

import 'package:movies/view_model/movie_view_model.dart';
import 'package:movies/view_model/base_view_model.dart';

import 'package:flutter/material.dart';

import 'movie_recommend_view.dart';


class MovieView extends StatelessWidget {

  final String id, title;


  MovieView(this.id, this.title);

  @override
  Widget build(BuildContext context) {

    final _themeData = themeData(context);
    final _isDark = isDark(context);

    return ProviderView<MovieViewModel>(
      viewModel: MovieViewModel(id),
      builder: (context, model, _) {

        final iconColor = _themeData.appBarTheme.textTheme.headline6.color;

        final backgroundColor = _isDark ? _themeData.scaffoldBackgroundColor : model.color;
        final titleColor = _isDark ? iconColor: model.titleColor ?? iconColor;

        return Scaffold(
          appBar: AppBar(
            brightness: Brightness.dark,
            backgroundColor: backgroundColor,
            elevation: 0,
            title: Text(title, style: TextStyle(color: titleColor)),
            actions: _actionButtons(context, model),
            iconTheme: IconThemeData(color: titleColor),
          ),
          body: SafeArea(
            child: _body(model),
          ),
          backgroundColor:backgroundColor,
        );
      },
    );
  }

  List<Widget> _actionButtons(BuildContext context, MovieViewModel model) {

    if (model.viewState != ViewState.refreshCompleted) {
      return [];
    }

    return [
      Row(
        children: [
          IconButton(
              icon: Icon(Icons.movie_filter),
              onPressed: () => showModalContent(context, S.of(context).movie_recommended, MovieRecommendView(id)))
        ],
      )
    ];

  }

  Widget _body(MovieViewModel model) {

    final state = model.viewState;
    final movie = model.movie;

    if (state == ViewState.onRefresh) {
      return RefreshCircularIndicator();
    }

    if (state == ViewState.refreshError) {
      return ErrorView(model.message, onRefresh: model.onRefresh);
    }

    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return Column(
              children: <Widget>[
                MovieCoverView(movie.cover),
                MovieRatingView(movie),
                MovieSummaryView(movie.intro),
                MovieStaffView(movie.staffs),
                MovieTrailerView(movie),
                MovieOtherView(movie)
              ],
            );
          }, childCount: 1),
        )
      ],
    );
  }
}
