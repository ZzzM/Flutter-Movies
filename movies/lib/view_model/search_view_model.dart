import 'package:movies/model/search_model.dart';
import 'package:movies/util/network_manager.dart';
import 'base_view_model.dart';

class SearchResultsViewModel extends BaseListViewModel<SearchResults> {

  String text;

  SearchResultsViewModel(text):super(id: text);

  @override
  Api get api => Api.fetchSearchResults;

  @override
  get param => {
    'start': start,
    'count': count,
    'q': id,
    'type': 'movie'
  };



  @override
  SearchResults modelFromJson(json) {
    return SearchResults.fromJson(json);
  }

}

class SearchSuggestionsViewModel extends BaseListViewModel<SearchSuggestions> {

  @override
  Api get api => Api.fetchSearchSuggestions;

  @override
  SearchSuggestions modelFromJson(json) {
    return SearchSuggestions.fromJson(json);
  }


}