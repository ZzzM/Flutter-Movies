import 'package:cached_network_image/cached_network_image.dart';
import 'package:movies/model/comment_model.dart';
import 'package:movies/util/util.dart';
import 'package:flutter/material.dart';


class CommentItemView extends StatelessWidget {

  final CommentListItem item;
  final VoidCallback onTap;

  CommentItemView(this.item, {this.onTap});

  @override
  Widget build(BuildContext context) {

    return Card(
        child: InkWell(
          child: Container(
            child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _headerView(context),
                    SizedBox(height: 5),
                    Text(item.abstract, style: TextStyle(fontSize: 13)),
                  ],
                )
            ),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          ),
          onTap: onTap,
        )
    );

  }


  Widget _headerView(BuildContext context) {

    final _isDark = isDark(context);
    final none = _isDark ? Colors.white30: Colors.black12;
    final count = _isDark ? Colors.white: Colors.black45;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          child: Row(
            children: <Widget>[
              _avatarView,
              SizedBox(width: 5),
              _ratingView(none)
            ],
          ),
        ),
        _thumbView(count),
      ],
    );
  }

  Widget get _avatarView {
    return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.transparent,
      backgroundImage:
      CachedNetworkImageProvider(item.user.avatar),
    );
  }

  Widget _ratingView(Color color) {

    final stars = List<Widget>();

    num value = item.rating.value;
    stars.addAll(List<Widget>.filled(value.toInt(), Icon(Icons.star, size: 15, color: Colors.amberAccent)));
    stars.addAll(List<Widget>.filled(5-value.toInt(), Icon(Icons.star, size: 15, color: color)));
    stars.add(SizedBox(width: 5));
    stars.add(Text(item.create_time.substring(0,10), style: TextStyle(fontSize: 12)));

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(item.user.name,
            style: TextStyle(fontWeight: FontWeight.bold)),
        Row(
          children: stars,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ],
    );

  }


  Widget _thumbView(Color color) {
    return Row(
      children: <Widget>[
        Icon(Icons.thumb_up, size: 15, color: color),
        SizedBox(width: 5),
        Text(item.useful_count.toString(), style: TextStyle(color: color)),
      ],
    );
  }


}
