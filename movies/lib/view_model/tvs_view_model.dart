import 'package:movies/model/movie_model.dart';
import 'package:movies/util/network_manager.dart';

import 'base_view_model.dart';

class TVsViewModel extends BaseListViewModel<MovieList> {

  TVsViewModel(id):super(id: id);

  @override
  Api get api => Api.fetchMovieList;

  @override
  String get extra => id;

  @override
  MovieList modelFromJson(json) {
    return MovieList.fromJson(json);
  }

  update(String _id) {

    if (id != _id) {
      id = _id;
      onRefresh();
    }

  }

}

