import 'base_model.dart';
import 'movie_model.dart';

class SearchResults extends BaseList {

  SearchResults.fromJson(json) : super.fromJson(json) {
    subjects = (json['subjects'] as List)
        .map( (json) => MovieGridItem.fromJson(json))
        .toList();
  }

}

class SearchSuggestions extends BaseList {

  SearchSuggestions.fromJson(json) : super.fromJson(json) {
    subjects = (json['items'] as List)
        .map( (json) => MovieListItem.fromJson(json))
        .toList();
  }

}