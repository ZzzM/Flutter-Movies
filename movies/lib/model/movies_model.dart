import 'package:movies/model/base_model.dart';

class HomeSearchList extends BaseList {
  HomeSearchList.fromJson(json) : super.fromJson(json) {
    subjects = (json['subjects'] as List)
        .map( (json) => HomeSearchItem.fromJson(json))
        .toList();
  }
}

class HomeSearchItem extends BaseMovie {

  String rate, cover;


  HomeSearchItem.fromJson(json) : super.fromJson(json) {
      String _rate = json['rate'];
      cover = json['cover'];
      rate = _rate.isNotEmpty ? _rate : '0';

  }


}

class MoviesToday {

  String comment, lunar, cover;
  BaseMovie movie;
  BaseRating rating;
  BaseColor color;


  MoviesToday.fromJson(json)  {
    comment = json['comment']['content'];
    lunar = '农历' + json['today']['description'];
    movie = BaseMovie.fromJson(json['subject']);
    cover = json['subject']['pic']['normal'].toString().replaceAll('webp', 'jpg');
    rating = BaseRating.fromJson(json['subject']['rating']);
    color =  BaseColor.fromJson(json['subject']['color_scheme']);
  }


}