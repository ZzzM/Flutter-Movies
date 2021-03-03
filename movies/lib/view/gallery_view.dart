import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:movies/generated/l10n.dart';

import 'package:movies/model/base_model.dart';

import 'package:movies/util/router_manager.dart';
import 'package:flutter/material.dart';
import 'package:movies/util/util.dart';
import 'package:movies/view/refresh_view.dart';
import 'package:movies/view/save_view.dart';

import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';


class GalleryView extends StatefulWidget {


  static open(BuildContext context, List<GalleryItem> galleryItems, int index) {


    Navigator.push(
        context,
        PageRouteBuilder(
            pageBuilder: (context, animation, __) {
              return FadeTransition(
                opacity: animation,
                child: GalleryView(galleryItems, index),
              );
            }
        )
    );
  }

  final List<GalleryItem> galleryItems;
  final int index;

  GalleryView(this.galleryItems, this.index);

  @override
  _GalleryViewState createState() => _GalleryViewState();

}

class _GalleryViewState extends State<GalleryView> {

  int _currentIndex;
  PageController _pageController;


  @override
  void initState() {
    // TODO: implement initState
    _currentIndex = widget.index;
    _pageController = PageController(initialPage: widget.index);

    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            "${_currentIndex + 1} / ${widget.galleryItems.length}",
            style: TextStyle(color: Colors.white),
          ),
          leading:  IconButton(
              icon: Icon(Icons.close),
              onPressed: () => RouterManager.pop(context)),
          actions: [_saveWidget],
        ),
        body: PhotoViewGallery.builder(
            scrollPhysics: BouncingScrollPhysics(),
            itemCount: widget.galleryItems.length,
            loadingBuilder: (context, event){

              double value = event == null ?
              0 : event.cumulativeBytesLoaded / event.expectedTotalBytes;

              return  RefreshCircularIndicator(value: value, backgroundColor: Colors.white);
            },
            pageController: _pageController,
            onPageChanged: _onPageChanged,
            builder: _itemView),
    );

  }

  Widget get _saveWidget {

    final galleryItem = widget.galleryItems[_currentIndex];

    return IconButton(
      icon: Icon(Icons.save),
      onPressed: () async {

        FileInfo info = await DefaultCacheManager().getFileFromCache(galleryItem.url);

        if (info != null) {
          showModalBottomSheet(context: context,
              builder: (_) {
                return SaveView(info.file.path);
              });

        } else {
          showSnackBar(context, S.of(context).file_downloading);
        }

      }
    );
  }

  _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  PhotoViewGalleryPageOptions _itemView(BuildContext context, int index) {

    final item = widget.galleryItems[index];
    final imageProvider = CachedNetworkImageProvider(item.url);


    return PhotoViewGalleryPageOptions(
      heroAttributes: PhotoViewHeroAttributes(tag: item.url),
      imageProvider: imageProvider,
      initialScale: PhotoViewComputedScale.contained,
      minScale: PhotoViewComputedScale.contained * (0.5 + index / 10),
      maxScale: PhotoViewComputedScale.covered * 1.1,
    );
  }

}
