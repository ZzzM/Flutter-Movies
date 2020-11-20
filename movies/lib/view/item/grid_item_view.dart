import 'package:cached_network_image/cached_network_image.dart';
import 'package:movies/view/rating_view.dart';
import 'package:movies/model/movie_model.dart';
import 'package:flutter/material.dart';


class GridItemView extends StatelessWidget {

  final MovieGridItem item;
  final VoidCallback onTap;

  GridItemView(
    this.item,
    this.onTap
  );


  @override
  Widget build(BuildContext context) {

    return Card(
        child: InkWell(
            onTap: onTap,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _imageView,
                _titleView,
                _ratingView
              ],
            )

        )
    );
  }

  Widget get _imageView {

    return Expanded(
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(3.0),
                    topRight: Radius.circular(3.0)
                ),
                image: DecorationImage(
                    image: CachedNetworkImageProvider(item.cover),
                    fit: BoxFit.cover)
            )
        )
    );
  }

  Widget get _titleView {

    return Padding(
      child: Text(
          item.title,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold)
      ),
      padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
    );
  }

  Widget get _ratingView {
    return Padding(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RatingStarView(
              item.rating.fullCount,
              Icon(Icons.star, size: 15, color: Colors.amberAccent),
              item.rating.emptyCount,
              Icon(Icons.star_border, size: 15, color: Colors.amberAccent),
              halfCount: item.rating.halfCount,
              halfIcon: Icon(Icons.star_half,
                  size: 15, color: Colors.amberAccent)

          ),
          RatingScoreView(item.rating.value != 0 ? item.rating.value.toString() : '',
              normalSize: 10,
              noneSize: 10,
              noneColor: Colors.grey),
        ],
      ),
      padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
    );
  }
}