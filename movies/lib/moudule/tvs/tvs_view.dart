import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/generated/l10n.dart';
import 'package:movies/moudule/tvs/tvs_tab_view.dart';
import 'package:movies/util/constant.dart';

class TVsView extends StatefulWidget {
  @override
  _TVsViewState createState() => _TVsViewState();
}

class _TVsViewState extends State<TVsView>  {




  @override
  Widget build(BuildContext context) {

    final _tabs = [Tab(text: S.of(context).tab_tvs), Tab(text: S.of(context).tab_shows)];

    return DefaultTabController(
        length: _tabs.length,
        child: Scaffold(
          appBar: AppBar(
            title:TabBar(
                unselectedLabelColor: ConsColor.border,
                labelColor: ConsColor.theme,
                indicatorColor: ConsColor.theme,
                indicatorSize: TabBarIndicatorSize.label,
                labelStyle: TextStyle(fontSize: 18),
                unselectedLabelStyle: TextStyle(fontSize: 15),
                tabs: _tabs,
              ),
          ),
          body: TabBarView(
            children: TabItem.tabViews,
          ),
        )
    );
  }
}


class TabItem {

  final String type;
  final List<String> tags;

  TabItem({
    @required this.type,
    @required this.tags,
  });


  static final List<TVsTabView> tabViews = _items.map((item) => TVsTabView(item.type, item.tags)).toList();


  static final List<TabItem> _items = [

    TabItem(
      type: 'tv',
        tags: ['tv_hot','tv_domestic','tv_american','tv_japanese','tv_korean','tv_animation'],
    ),
    TabItem(
      type: 'show',
        tags: ['show_hot','show_domestic','show_foreign'],
    ),

  ];
}