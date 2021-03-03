import 'package:movies/model/comment_model.dart';
import 'package:movies/model/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:movies/model/photo_model.dart';
import 'package:movies/util/util.dart';
import 'base_view_model.dart';

class MovieViewModel extends BaseViewModel {

  Movie movie;
  Color color, titleColor;

  String id;

  MovieViewModel(this.id) {
    onRefresh();
  }

  @override
  String get extra => id;

  @override
  refreshCompleted(json) {
    movie = Movie.fromJson(json);
    color = hexColor(movie.color.primary);
    titleColor = Colors.white;
  }

}

class MovieRecommendViewModel extends BaseViewModel {

  List<MovieGridItem> movies;

  final String id;

  MovieRecommendViewModel(this.id) {
    onRefresh();
  }

  @override
  String get extra => '$id/recommendations';

  @override
  refreshCompleted(json) {
    movies = (json as List).map((item) => MovieGridItem.fromJson(item)).toList();
  }

  @override
  bool get isEmpty => movies.isEmpty;

  @override
  bool get refreshNoData {
    if (movies != null) {
      return isEmpty;
    }
    return true;
  }
}

class MovieCommentViewModel extends BaseListViewModel<CommentList> {

  MovieCommentViewModel(id):super(id: id);

  @override
  int get pageStart => 1;

  @override
  String get extra => '$id/interests';

  @override
  int get count => 15;

  @override
  CommentList modelFromJson(json) {
    return CommentList.fromJson(json);
  }

}


class MovieReviewViewModel extends MovieCommentViewModel {

  MovieReviewViewModel(id) : super(id);

  @override
  String get extra => '$id/reviews';

}

class MoviePhotoViewModel extends BaseListViewModel<PhotoList> {

  PhotoList list;

  MoviePhotoViewModel(id) : super(id: id);

  @override
  String get extra => '$id/photos';

  @override
  int get pageStart => 1;

  @override
  int get count => 20;

  @override
  PhotoList modelFromJson(json) {
    return PhotoList.fromJson(json);
  }

}