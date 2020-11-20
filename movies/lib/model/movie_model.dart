import 'base_model.dart';

class MovieList extends BaseList {

  MovieList.fromJson(json) : super.fromJson(json) {
    id = json['subject_collection']['id'];
    name = json['subject_collection']['name'];
    subjects = (json['subject_collection_items'] as List)
        .map( (json) => MovieListItem.fromJson(json))
        .toList();

  }

}

class Movie extends BaseMovie {

  String cover;

  BaseColor color;

  List<GalleryItem> actors;
  List<GalleryItem> directors;

  MovieTrailer trailer;

  bool released;
  String intro;
  String pubdate;
  String durations;
  String languages;
  String countries;
  String genres;
  String url;

  List<GalleryItem> get staffs {
    actors.forEach((v) => v.subTitle = '');
    directors.forEach((v) => v.subTitle = 'movie.director');
    return directors + actors;
  }

  Movie.fromJson(json) : super.fromJson(json) {


    cover = json['pic']['normal'].toString().replaceAll('webp', 'jpg');
    actors = (json['actors'] as List).map((v) => GalleryItem.formStaff(v)).toList();
    directors = (json['directors'] as List).map((v) => GalleryItem.formStaff(v)).toList();
    color = BaseColor.fromJson(json['color_scheme']);
    intro = json['intro'];
    url = json['info_url'];


    if (json['trailer'] != null) {
      trailer = MovieTrailer.fromJson(json['trailer']);
    }

    released = json['is_released'];
    pubdate = (json['pubdate'] as List).join(' / ');
    durations = (json['durations'] as List).join(' / ');
    genres = (json['genres'] as List).join(' / ');
    languages = (json['languages'] as List).join(' / ');
    countries = (json['countries'] as List).join(' / ');
  }

}

class MovieListItem extends BaseMovie {


  String subtitle;
  String info;
  String cover;

  List actors;
  List directors;

  String year;
  String release_date;

  String original_title;

  String description;

  String get genre {
    final list = info.split('/');
    if (list.length > 2) {
      return list[1].trim();
    }
    return info;
  }


  MovieListItem.fromJson(json) : super.fromJson(json) {

    subtitle = json['card_subtitle'];
    info = json['info'];
    cover = json['cover']['url'].toString().replaceAll('webp', 'jpg');
    actors = json['actors'];
    directors = json['directors'];
    year = json['year'];
    release_date = json['release_date'];
    original_title = json['original_title'];
    description = json['description'];

  }


}

class MovieGridItem extends BaseMovie {

  String cover;
  String url;

  MovieGridItem.fromJson(json) : super.fromJson(json) {

    cover = json['pic']['normal'].toString().replaceAll('webp', 'jpg');
    url = json['url'];

  }


  MovieGridItem.from(MovieListItem movie) : super() {

    id = movie.id;
    title = movie.title;
    cover = movie.cover;
    rating = movie.rating;

  }

}




class MovieTrailer extends BaseMovie {

  String cover;
  String video;

  MovieTrailer.fromJson(json) : super.fromJson(json) {
    cover = json['cover_url'];
    video = json['video_url'];
  }

}


