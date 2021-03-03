import 'package:flutter/cupertino.dart';
import 'package:movies/model/movie_model.dart';
import 'package:movies/util/router_manager.dart';
import 'package:movies/view/base_view.dart';
import 'package:movies/view/item/list_item_view.dart';
import 'package:movies/view_model/search_view_model.dart';

class SearchSuggestionsView extends BaseRefreshView<SearchSuggestionsViewModel> {

  SearchSuggestionsView()
      : super(
      viewModel: SearchSuggestionsViewModel(),
      enablePullUp: true,
      enableAppBar: false);


  @override
  Widget bodyView(BuildContext context) {

    final list = viewModel.list;

    return ListView.builder(
        itemExtent: 150,
        itemCount: list.subjects.length,
        itemBuilder: (context, index) {
          MovieListItem item = list.subjects[index];
          return ListItemView(item, () {
            RouterManager.toDetail(
                context, RouterType.detail, item.path, item.title);
          });
        });
  }

}