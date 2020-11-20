import 'package:movies/model/user_model.dart';

import 'base_model.dart';

class CommentList extends BaseList {

  CommentList.fromJson(json) : super.fromJson(json) {
    subjects = ((json['interests'] ?? json['reviews']) as List)
        .map( (json) => CommentListItem.fromJson(json))
        .toList();
  }

}

class CommentListItem extends BaseMovie {

  num useful_count;
  String url;
  String abstract;
  String create_time;
  User user;

  CommentListItem.fromJson(json) : super.fromJson(json) {

    useful_count = json['useful_count'] ?? json['vote_count'];
    url = json['url'];
    abstract = json['abstract'] ?? json['comment'];
    create_time = json['create_time'];
    user = User.fromJson(json['user']);
  }

}

