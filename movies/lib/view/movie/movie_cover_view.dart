import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MovieCoverView extends StatelessWidget {

  final String url;

  MovieCoverView(this.url);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: CachedNetworkImageProvider(url),
                  fit: BoxFit.cover),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 5,
                )
              ]),
          width: 135,
          height: 200,
          margin: EdgeInsets.only(top: 15),
        )
      ],
    );
  }
}
