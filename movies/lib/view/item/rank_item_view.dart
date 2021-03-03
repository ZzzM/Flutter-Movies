import 'package:cached_network_image/cached_network_image.dart';
import 'package:movies/model/rank_model.dart';
import 'package:movies/util/constant.dart';
import 'package:movies/util/util.dart';
import 'package:flutter/material.dart';


class RankItemView extends StatelessWidget {

  final RankListItem item;
  final VoidCallback onTap;

  RankItemView(this.item, this.onTap);

  @override
  Widget build(BuildContext context) {

    return InkWell(
      child: _coverView,
      onTap: onTap,
    );

  }

  Widget get _coverView {

    final color = hexColor(item.color.primary);

    return Container(
        child: Container(
          child: Center(
            child: Padding(
              child: Text(item.name, style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
              padding: EdgeInsets.all(10),
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                color,
                color.withOpacity(0.7)
              ],
            ),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
            image: DecorationImage(
                image: CachedNetworkImageProvider(item.header_bg_image),
                fit: BoxFit.cover
            ),
        )
    );
  }



}
