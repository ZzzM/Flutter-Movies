
import 'package:flutter/material.dart';
import 'package:movies/model/home_model.dart';
import 'package:movies/view/rating_view.dart';

class HomeSearchItemView extends StatelessWidget {

  final HomeSearchItem item;
  final VoidCallback onTap;


  HomeSearchItemView(this.item, {this.onTap});

  @override
  Widget build(BuildContext context) {

    return Card(
        child: ListTile(
          title: Text(
            item.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          trailing:  RatingScoreView(item.rate, normalColor: Colors.orange, noneColor: Colors.grey),
          onTap: onTap,
        )
    );
  }

}
