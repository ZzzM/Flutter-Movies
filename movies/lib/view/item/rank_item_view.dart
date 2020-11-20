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

    return Column(
      children: [
        SizedBox(height: 10),
        InkWell(
          child: Container(
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Row(
                  children: [
                    SizedBox(width: 119),
                    _contentView(context),
                  ],
                ),
                _coverView,
              ],
            ),
            padding: EdgeInsets.symmetric(horizontal: 10),
          ),
          onTap: onTap,
        ),
      ],
    );


  }

  Widget get _coverView {

    return Container(
        height: 120,
        width: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            image: DecorationImage(
                image: CachedNetworkImageProvider(item.cover_url),
                fit: BoxFit.fill
            ),
          boxShadow: [
            BoxShadow(color: ConsColor.border, blurRadius: 5, offset: Offset(3,3))
          ]
        )
    );
  }

  Widget _contentView(BuildContext context) {

    final _themeData = themeData(context);

    return Container(
        width: screenWidth(context) - 140,
        height: 90,
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: _themeData.scaffoldBackgroundColor,
          border: Border.all(color: ConsColor.border, width: 0.5),
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(5),
              topRight: Radius.circular(5)),

        ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: item.items.map((movie) => _itemView(movie)).toList(),
      )
    );
  }

  Widget _itemView(RankMovie movie) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(movie.title,
              style: TextStyle(fontWeight: FontWeight.w300),
              overflow: TextOverflow.ellipsis)
        ),
        SizedBox(width: 10),
        Text('${movie.rating.value}',
            style: TextStyle(color: Colors.orange)),
        SizedBox(width: 5)
      ],
    );

  }

}
