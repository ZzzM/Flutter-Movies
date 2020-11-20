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