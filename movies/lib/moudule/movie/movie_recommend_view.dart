
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:movies/util/router_manager.dart';

import 'package:movies/view/base_view.dart';

import 'package:movies/view/item/grid_item_view.dart';
import 'package:movies/view/refresh_view.dart';

import 'package:movies/view_model/movie_view_model.dart';

import 'package:flutter/material.dart';


class MovieRecommendView extends BaseRefreshView<MovieRecommendViewModel> {


  MovieRecommendView(id)
      : super(
      enableAppBar: false,
      enablePullDown: false,
      viewModel: MovieRecommendViewModel(id));


  @override
  Widget bodyView(BuildContext context) {

    final movies = viewModel.movies;

    return AnimationLimiter(
      child: GridView.count(
        padding: EdgeInsets.all(10),
        crossAxisCount: 3,
        childAspectRatio: 2 / 3,
        children: movies.asMap().entries.map((entry) {

          final index = entry.key, item = entry.value;

          return AnimationConfiguration.staggeredGrid(
            duration: const Duration(milliseconds: 500),
              position: index,
              columnCount:  3,
              child: ScaleAnimation(
                child: FadeInAnimation(
                  child: GridItemView(item, () {
                    RouterManager.toDetail(
                        context, RouterType.detail, item.path, item.title);
                  }),
                ),
              )
          );
        }).toList(),
      )
    );


  }

}
