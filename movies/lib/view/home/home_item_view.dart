import 'package:flutter/material.dart';
import 'package:movies/model/movie_model.dart';
import 'package:movies/util/constant.dart';
import 'package:movies/util/util.dart';
import '../item/grid_item_view.dart';

class HomeItemView extends StatelessWidget {

  final MovieList list;
  final VoidCallback onTitleTap;
  final void Function(MovieGridItem) onItemTap;

  HomeItemView(this.list, {this.onTitleTap, this.onItemTap});

  @override
  Widget build(BuildContext context) {

    List<MovieGridItem> subjects = list.subjects
        .map((item) => MovieGridItem.from(item))
        .toList();

    return Column(
        children: [
          ListTile(
              title: Text(list.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              trailing: Icon(Icons.chevron_right, color: ConsColor.theme),
              onTap: onTitleTap),
          Container(
            height: screenWidth(context) - 20,
            child: GridView.count(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 10),
              childAspectRatio: 2/3,
              crossAxisCount: 3,
              children: subjects
                  .map((item) {
                return GridItemView(item, () {
                  onItemTap(item);
                });
              }).toList(),
            ),
          )
        ]);
  }

}
