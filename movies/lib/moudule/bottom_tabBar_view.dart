import 'package:movies/moudule/home/home_view.dart';
import 'package:movies/moudule/rank/rank_view.dart';
import 'package:movies/moudule/settings/settings_view.dart';
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
      page: HomeView(),
      icon: Icon(Icons.local_play),
      title: '',
    ),
    TabNavigationItem(
      page: RankView(),
      icon: Icon(Icons.bookmark_border),
      title: '',
    ),
    TabNavigationItem(
      page: SettingsView(),
      icon: Icon(Icons.settings),
      title: '',
    ),

  ];
}
