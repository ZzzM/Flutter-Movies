import 'package:movies/model/rank_model.dart';
import 'package:movies/util/router_manager.dart';
import 'package:movies/view/base_view.dart';
import 'package:movies/view/item/rank_item_view.dart';
import 'package:movies/view_model/rank_view_model.dart';
import 'package:flutter/material.dart';



class RankView extends BaseRefreshView<RankViewModel> {

  RankView() : super(
      title: 'tab.rank',
      viewModel: RankViewModel()
  );

  @override
  Widget get bodyView {

    final list = viewModel.list;

    return ListView.builder(
        itemCount: list.subjects.length ?? 0,
        itemBuilder: (context, index) {

          RankListItem item = list.subjects[index];

          return RankItemView(item, () {
            RouterManager.toMovie(context, RouterType.rank_list,
                item.id, item.name);
          });

        });
  }


}
