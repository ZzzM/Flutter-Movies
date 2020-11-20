import 'package:movies/model/movie_model.dart';
import 'package:movies/util/router_manager.dart';
import 'package:movies/view/base_view.dart';
import 'package:movies/view/item/list_item_view.dart';

import 'package:flutter/material.dart';
import 'package:movies/view_model/rank_view_model.dart';

class RankListView extends BaseRefreshView<RankListViewModel> {

  RankListView(id, title)
      : super(
            title: title,
            viewModel: RankListViewModel(id),
            enablePullUp: true);

  @override
  Widget get bodyView {

    final list = viewModel.list;

    return ListView.builder(
        itemExtent: 150,
        itemCount: list.subjects.length,
        itemBuilder: (context, index) {
          MovieListItem item = list.subjects[index];
          return ListItemView(item, () {
            RouterManager.toMovie(
                context, RouterType.detail, item.id, item.title);
          });
        });
  }
}
