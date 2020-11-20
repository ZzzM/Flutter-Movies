import 'package:flutter/material.dart';
import 'package:movies/model/home_model.dart';
import 'package:movies/util/localization_manager.dart';
import 'package:movies/util/router_manager.dart';
import 'package:movies/util/util.dart';
import 'package:movies/view/base_view.dart';
import 'package:movies/view/home/home_search_item_view.dart';
import 'package:movies/view/home/home_search_suggestion_view.dart';
import 'package:movies/view_model/home_view_model.dart';

class HomeSearchView extends BaseRefreshView<HomeSearchViewModel> {
  final String tag, type;
  final VoidCallback onBuild;

  HomeSearchView(this.tag, this.type, this.onBuild)
      : super(
            viewModel: HomeSearchViewModel(tag, type),
            enableAppBar: false,
            enablePullUp: true) {
    onBuild();
  }

  @override
  Widget get bodyView {

    final list = viewModel.list;

    return ListView.builder(
        itemCount: list.subjects.length,
        itemBuilder: (context, index) {
          HomeSearchItem item = list.subjects[index];

          return HomeSearchItemView(item, onTap: () {
            RouterManager.toMovie(
                context, RouterType.detail, item.id, item.title);
          });
        });
  }
}

class HomeSearchDelegate extends SearchDelegate {
  String _type = '',
      _searchFieldLabel = '';

  @override
  ThemeData appBarTheme(BuildContext context) {

    _searchFieldLabel = LocalizationManger.i18n(context, 'home.enter');

    return themeData(context).copyWith(
        textTheme:
            TextTheme(headline6: TextStyle(color: Colors.white, fontSize: 18)));
  }

  @override
  TextStyle get searchFieldStyle =>
      TextStyle(color: Colors.white, fontSize: 18);

  @override
  String get searchFieldLabel => _searchFieldLabel;


  @override
  List<Widget> buildActions(BuildContext context) {

    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return BackButton(
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return buildSuggestions(context);
    }

    return HomeSearchView(query, _type, () {
      _type = '';
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return HomeSearchSuggestionView((tag, type) {
      query = tag;
      _type = type;
      showResults(context);
    });
  }

}
