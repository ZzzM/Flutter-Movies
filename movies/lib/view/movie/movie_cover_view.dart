import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/model/base_model.dart';
import 'package:movies/view/gallery_view.dart';

class MovieCoverView extends StatelessWidget {
  final String url;

  MovieCoverView(this.url);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () {
             GalleryView.open(context, [GalleryItem.formUrl(url)], 0);
          },
          child: Hero(
            tag: url,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(url), fit: BoxFit.cover),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 5,
                    )
                  ]),
              width: 135,
              height: 200,
              margin: EdgeInsets.only(top: 15),
            ),
          ),
        )
      ],
    );
  }
}
