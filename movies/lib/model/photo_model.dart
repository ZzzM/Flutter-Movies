import 'base_model.dart';

class PhotoList extends BaseList {

  List<GalleryItem> get items {
    return subjects.map((item) => GalleryItem.formPhoto(item)).toList();
  }

  PhotoList.fromJson(json) : super.fromJson(json) {
    subjects = (json['photos'] as List)
        .map( (json) => PhotoListItem.fromJson(json))
        .toList();
  }

}

class PhotoListItem {
  String id;
  PhotoInfo s, m, l;

  PhotoListItem.fromJson(json) {
   id = json['id'];
   s = PhotoInfo.fromJson(json['image']['small']);
   m = PhotoInfo.fromJson(json['image']['normal']);
   l = PhotoInfo.fromJson(json['image']['large']);
  }
}

class PhotoInfo {

  String url;
  num width;
  num height;

  PhotoInfo.fromJson(json) {
    url = json['url'];
    width = json['width'];
    height = json['height'];
  }
}