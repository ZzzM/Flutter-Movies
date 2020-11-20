
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

  final String id;
  final String title;

  MovieView(this.id, this.title);

  @override
  Widget build(BuildContext context) {

    final _themeData = themeData(context);
    final _isDark = isDark(context);

    return ProviderView<MovieViewModel>(
      viewModel: MovieViewModel(id),
      builder: (context, model, _) {

        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: _isDark ? _themeData.primaryColor : model.color,
            title: Text(title),
            centerTitle: true,
            actions: _actionButtons(context, model),
          ),
          body: SafeArea(
            child: _body(model),
          ),
          backgroundColor:
              _isDark ? _themeData.scaffoldBackgroundColor : model.color,
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
              onPressed: () {
                return showModalBottomSheet(context: context, builder: (_) {
                  return MovieRecommendView(id);
                });
              })
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
