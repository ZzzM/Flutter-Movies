import 'package:movies/model/movie_model.dart';
import 'package:movies/util/localization_manager.dart';
import 'package:movies/util/router_manager.dart';
import 'package:movies/util/util.dart';
import 'package:movies/view/base_view.dart';
import 'package:movies/view/home/home_item_view.dart';
import 'package:movies/view_model/home_view_model.dart';
import 'package:flutter/material.dart';

import 'home_search_view.dart';


class HomeView extends BaseRefreshView<HomeViewModel> {

  HomeView() : super(
      title: 'tab.home',
      viewModel: HomeViewModel()
  );

  @override
  Widget get bodyView {

    final lists = viewModel.lists;

    return ListView.builder(
        itemCount: lists.length ?? 0,
        itemBuilder: (context, index) {
          MovieList list = lists[index];

          return HomeItemView(list, onTitleTap: () {
            RouterManager.toMovie(
                context, RouterType.home_list, list.id, list.name);
          }, onItemTap: (item) {
            RouterManager.toMovie(
                context, RouterType.detail, item.id, item.title);
          });

        });
  }

  @override
  Widget titleView(BuildContext context) {

    final _isDark = isDark(context);
    final searchBar = _isDark ? Colors.white.withOpacity(0.1): Colors.white.withOpacity(0.3);

    return GestureDetector(

      onTap: () {
        showSearch(context: context, delegate: HomeSearchDelegate());
      },
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 5),
          color: searchBar,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.search, color: Colors.white),
              SizedBox(width: 5),
              Text(LocalizationManger.i18n(context, 'home.search'), style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold))
            ],
          )
      ),
    );
  }



}
