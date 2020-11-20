import 'package:movies/model/movie_model.dart';

import 'package:movies/util/localization_manager.dart';

import 'package:movies/util/router_manager.dart';
import 'package:movies/util/util.dart';

import 'package:movies/view/error_view.dart';
import 'package:movies/view/item/grid_item_view.dart';
import 'package:movies/view/provider_view.dart';
import 'package:movies/view_model/movie_view_model.dart';
import 'package:movies/view_model/base_view_model.dart';
import 'package:flutter/material.dart';
import '../../view/refresh_view.dart';

class MovieRecommendView extends StatelessWidget {

  final String id;

  MovieRecommendView(this.id);

  @override
  Widget build(BuildContext context) {
    return ProviderView<MovieRecommendViewModel>(
      viewModel: MovieRecommendViewModel(id),
      builder: (context, model, _) {
        return SizedBox(
            child: Column(
              children: [
                SizedBox(height: 15),
                Text(LocalizationManger.i18n(context, 'movie.recommended'),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Container(
                  height: screenWidth(context),
                  child: _body(context, model),
                )
              ],
            ));
      },
    );
  }

  Widget _body(BuildContext context, MovieRecommendViewModel model) {
    final state = model.viewState;
    List<MovieGridItem> movies = model.movies;

    if (state == ViewState.onRefresh) {
      return RefreshCircularIndicator();
    }

    if (state == ViewState.empty || state == ViewState.refreshError) {
      return ErrorView(model.message, onRefresh: model.onRefresh);
    }

    return GridView.count(
      padding: EdgeInsets.all(10),
      crossAxisCount: 3,
      childAspectRatio: 2 / 3,
      children: movies.map((item) {
        return GridItemView(item, () {
              RouterManager.toMovie(
                  context, RouterType.detail, item.id, item.title);
            });
      }).toList(),
    );
  }
}
