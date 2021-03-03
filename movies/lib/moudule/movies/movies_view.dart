import 'package:flutter/cupertino.dart';
import 'package:movies/generated/l10n.dart';
import 'package:movies/util/router_manager.dart';
import 'package:movies/view/base_view.dart';
import 'package:movies/view/item/movies_item_view.dart';
import 'package:movies/view_model/movies_view_model.dart';

import 'movies_ranks_view.dart';
import 'movies_today_view.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class MoviesView extends BaseRefreshView<MoviesViewModel> {
  MoviesView()
      : super(viewModel: MoviesViewModel());

  @override
  Widget titleView(BuildContext context) {
    return Text(S.of(context).tab_movies);
  }

  @override
  Widget bodyView(BuildContext context) {

    return  ListView(
      children: [
        MoviesTodayView(viewModel.today),
        _itemsView(context),
        MoviesRanksView(viewModel.ranks)],
    );

  }


  Widget _itemsView(BuildContext context) {
    final lists = viewModel.lists;
    return Column(
      children: lists.map((list) {
        return MoviesItemView(list, onTap: ({id, title}){
          if (id != null) {
            _toDetail(context, RouterType.detail, id, title);
          } else {
            _toDetail(context, RouterType.movies_list, list.id, list.name);
          }
        });
      }).toList(),
    );
  }


  _toDetail(BuildContext context, RouterType type, String id, String title) {
    RouterManager.toDetail(context, type, id, title);
  }

}