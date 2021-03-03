import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movies/model/movie_model.dart';

import '../item/grid_item_view.dart';

class MoviesItemView extends StatelessWidget {
  static const itemHeight = 200.0, itemWidth = itemHeight * 2 / 3;

  final MovieList list;
  final void Function({String id, String title}) onTap;

  MoviesItemView(this.list, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _titleView,
      Container(
        height: itemHeight,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10),
          scrollDirection: Axis.horizontal,
          children: _itemsView,
        ),
      )
    ]);
  }

  Widget get _titleView {
    return Container(
        padding: EdgeInsets.fromLTRB(15, 15, 10, 5),
        child: InkWell(
            onTap: onTap,
            child: Row(
              children: [
                Text(list.name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Icon(Icons.chevron_right)
              ],
            )
        )
    );
  }

  List<Widget> get _itemsView {

    List<MovieGridItem> subjects =
        list.subjects.map((item) => MovieGridItem.from(item)).toList();

    return subjects.map((item) {
      return Container(
        width: itemWidth,
        child: GridItemView(item, () {
          onTap(id: item.path, title: item.title);
        }),
      );
    }).toList();

  }

}
