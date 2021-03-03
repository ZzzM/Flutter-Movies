import 'package:flutter/cupertino.dart';
import 'package:movies/util/router_manager.dart';
import 'package:movies/view/base_view.dart';
import 'package:movies/view/item/grid_item_view.dart';
import 'package:movies/view_model/search_view_model.dart';

class SearchResultsView extends BaseRefreshView<SearchResultsViewModel> {


  SearchResultsView(text)
      : super(
      viewModel: SearchResultsViewModel(text),
      enablePullUp: true,
      enableAppBar: false);


  @override
  Widget bodyView(BuildContext context) {

    final list = viewModel.list;

    return GridView.count(
      padding: EdgeInsets.all(10),
      crossAxisCount: 3,
      childAspectRatio: 2 / 3,
      children: list.subjects.map((item) {
        return GridItemView(item, () {
          RouterManager.toDetail(
              context, RouterType.detail, item.path, item.title);
        });
      }).toList(),
    );


  }

}