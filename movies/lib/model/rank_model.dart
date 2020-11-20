import 'package:movies/model/movie_model.dart';
import 'base_model.dart';

class RankList extends BaseList {

  RankList.fromJson(json) : super.fromJson(json) {
    subjects = (json['selected_collections'] as List)
        .map( (json) => RankListItem.fromJson(json))
        .toList();
  }

}

class RankListItem extends BaseMovie  {

  String header_bg_image;
  String cover_url;
  List<RankMovie> items;

  RankListItem.fromJson(json) : super.fromJson(json) {
    header_bg_image = json['header_bg_image'];
    cover_url = json['cover_url'];
    items = (json['items'] as List).map((v) => RankMovie.fromJson(v)).toList();
  }
}

class RankMovie extends BaseMovie {

  String cover;

  RankMovie.fromJson(json) : super.fromJson(json) {
    cover = json['pic']['normal'].toString().replaceAll('webp', 'jpg');
  }

}