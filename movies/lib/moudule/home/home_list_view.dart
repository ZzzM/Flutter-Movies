import 'package:flutter/material.dart';
import 'package:movies/moudule/rank/rank_list_view.dart';

class HomeListView extends StatelessWidget {

  final String id, title;

  HomeListView(this.id, this.title);

  @override
  Widget build(BuildContext context) {
    return RankListView(id, title);
  }

}
