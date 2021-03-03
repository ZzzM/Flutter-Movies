import 'package:flutter/material.dart';
import 'package:movies/generated/l10n.dart';
import 'package:movies/model/rank_model.dart';
import 'package:movies/util/router_manager.dart';
import 'package:movies/view/item/rank_item_view.dart';
class MoviesRanksView extends StatelessWidget {

  final RankList ranks;

  MoviesRanksView(this.ranks);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.fromLTRB(15, 15, 10, 5),
            child: Text(S.of(context).movies_ranks,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
        ),
        _gridView(context)
      ],
    );
    
  }
  
  
  Widget _gridView(BuildContext context) {

      return GridView.count(
        padding: EdgeInsets.all(10),
        shrinkWrap: true,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
        childAspectRatio: 1,
        physics: NeverScrollableScrollPhysics(),
        children: ranks.subjects.map((item) {
          return RankItemView(item, () {
            RouterManager.toDetail(
                context, RouterType.movies_list, item.id, item.name);
          });
        }).toList(),
      );

  }
  
}
