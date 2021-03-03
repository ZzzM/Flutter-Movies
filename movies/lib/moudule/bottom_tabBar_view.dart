import 'package:movies/moudule/movies/movies_view.dart';
import 'package:movies/moudule/search/search_view.dart';
import 'package:movies/moudule/settings/settings_view.dart';
import 'package:movies/moudule/tvs/tvs_view.dart';
import 'package:movies/util/constant.dart';
import 'package:flutter/material.dart';

class BottomTabBarView extends StatefulWidget {
  @override
  _BottomTabBarViewState createState() => _BottomTabBarViewState();
}

class _BottomTabBarViewState extends State<BottomTabBarView> {

  int _curr = 0;


  final _items = TabNavigationItem.items;


  @override
  Widget build(BuildContext context) {


    final _children = _items.map((item) {
      return item.page;
    }).toList();

    final _bottomItems = _items.map((item) {
      return BottomNavigationBarItem(
        label: item.title,
        icon: item.icon,
      );
    }).toList();

    return Scaffold(
      body: IndexedStack(
        index: _curr,
        children: _children,
      ),
      bottomNavigationBar:  BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ConsColor.theme,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        currentIndex: _curr,
        onTap: (index) {
          setState(() {
            _curr = index;
          });
        },
        items: _bottomItems,
      ),
    );
  }
}

class TabNavigationItem {

  final Widget page;
  final String title;
  final Icon icon;

  TabNavigationItem({
    @required this.page,
    @required this.title,
    @required this.icon,
  });

  static final List<TabNavigationItem> items = [
    TabNavigationItem(
      page: MoviesView(),
      icon: Icon(Icons.movie),
      title: '',
    ),
    TabNavigationItem(
      page: TVsView(),
      icon: Icon(Icons.tv),
      title: '',
    ),
    TabNavigationItem(
      page: SearchView(),
      icon: Icon(Icons.search),
      title: '',
    ),
    TabNavigationItem(
      page: SettingsView(),
      icon: Icon(Icons.settings),
      title: '',
    ),

  ];
}
