import 'package:cached_network_image/cached_network_image.dart';
import 'package:movies/model/base_model.dart';
import 'package:movies/model/movie_model.dart';
import 'package:movies/util/localization_manager.dart';
import 'package:flutter/material.dart';
import '../base_view.dart';
import '../gallery_view.dart';

class MovieStaffView extends StatelessWidget {


  final List<GalleryItem> galleryItems;


  MovieStaffView(this.galleryItems);

  @override
  Widget build(BuildContext context) {

    final items = galleryItems.where((item) {
      return item.url != null;
    }).toList();

    if (items.isNotEmpty) {
      return Container(
          padding: EdgeInsets.only(left: 15, right:15, top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              BaseTitleView('movie.casts'),
              Container(
                  margin: EdgeInsets.only(top: 5),
                  height: 150,
                  child: GridView.count(
                    scrollDirection: Axis.horizontal,
                    crossAxisCount: 1,
                    childAspectRatio: 3 / 2,
                    mainAxisSpacing: 10,
                    children: List.generate(items.length, (index) {

                      final item = items[index];

                      return Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            _imageView(context, item, items),
                            Text(item.title, style: TextStyle(fontSize: 11, color: Colors.white, fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis,),
                            Text(LocalizationManger.i18n(context, item.subTitle), style: TextStyle(fontSize: 9, color: Colors.white70))
                          ],
                        ),
                      );
                    })
                  )
              )
            ],
          ));
    }
    return SizedBox();

  }

  Widget _imageView(BuildContext context, GalleryItem item, List<GalleryItem> items) {

    final index = items.indexOf(item);

    return
      Container(
        height: 118,
        width: 100,
        child: GestureDetector(
          onTap: () {
            GalleryView.open(context, items, index);
          },
          child: CachedNetworkImage(imageUrl: item.url, fit: BoxFit.cover)
        ),
      );
  }
}
