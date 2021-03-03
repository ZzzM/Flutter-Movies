import 'package:movies/model/photo_model.dart';

class BaseList {

  num count, start, total;

  List subjects;

  String id, name;

  BaseList.fromJson(json){

    count = json['count'];
    start = json['start'];
    total = json['total'];

  }

}

class BaseMovie {

  String id, title, name, type;
  BaseRating rating;

  String get path => '.$type.$id';

  BaseMovie();

  BaseMovie.fromJson(json){

    id = json['id'];
    title = json['title'];
    name = json['name'];
    type = json['type'];
    rating = BaseRating.fromJson(json['rating']);
  }

}

class BaseRating {

  num value = 0, count = 0;

  String stars = '0.0';

  get fullCount {
    return num.parse(stars[0]).toInt();
  }

  get halfCount {
    if (stars.length > 2) {
      return num.parse(stars[2] ?? 0) ~/ 5;
    }
    return 0;
  }

  get emptyCount {
    return 5 - fullCount - halfCount;
  }


  BaseRating.fromJson(json) {
    if (json != null) {
      value = json['value'];
      stars = json['star_count'].toString();
      count = json['count'];
    }

  }

}

class BaseColor {

  bool isDark;

  String dark, light, secondary;

  get primary {
    return '#${isDark ? dark : light}';
  }

  BaseColor.fromJson(json) {
    isDark = json['is_dark'];
    dark = json['primary_color_dark'];
    light = json['primary_color_light'];
    secondary = json['secondary_color'];
  }

}

class GalleryItem {

  String id, url, title, subTitle;

  GalleryItem.formStaff(json) {
    id = 'staff_${json['id']}';
    url = json['cover_url'];
    title = json['name'];
    subTitle = json['title'];
  }

  GalleryItem.formPhoto(PhotoListItem item) {
    id = 'photo_${item.id}';
    url = item.l.url;
  }

  GalleryItem.formUrl(String value) {
    id = value;
    url = value;
  }

}


