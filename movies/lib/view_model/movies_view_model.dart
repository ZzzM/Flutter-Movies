import 'package:dio/dio.dart';
import 'package:movies/model/movies_model.dart';
import 'package:movies/model/movie_model.dart';
import 'package:movies/model/rank_model.dart';
import 'package:movies/util/network_manager.dart';

import 'base_view_model.dart';

class MoviesViewModel extends BaseViewModel {

  List<MovieList> lists = [];
  MoviesToday today;
  RankList ranks;

  MoviesViewModel() {
    onRefresh();
  }

  @override
  onRefresh() {

    setViewState(ViewState.onRefresh);
    Future.wait([
      _fetchToday(),
      _fetchList('movie_showing'),
      _fetchList('movie_soon'),
      _fetchList('movie_hot_gaia'),
      _fetchRanks(),
    ]).then((result) {

      result.removeWhere((element) => element == null);
      lists = result.map((e) => e as MovieList).toList();
      setViewState(ViewState.refreshCompleted);
      if (isEmpty) {
        setViewState(ViewState.empty);
      }
    }).catchError((error) {
      setViewState(ViewState.refreshError, message: error.message);
    });

  }

  @override
  bool get refreshNoData {
    if (lists != null) {
      return isEmpty;
    }
    return true;
  }

  @override
  bool get isEmpty => lists.isEmpty && ranks == null && today == null;

  @override
  Api get api => Api.fetchMovieList;

  @override
  get param => {'start': 0, 'count': 5};


  Future<MovieList> _fetchList(String extra) async {
    Response response = await NetworkManager.get(api,
        extra: extra,
        param: param);

    return MovieList.fromJson(response.data);

  }

  Future _fetchToday() async {

    Response response = await NetworkManager.get(Api.fetchToday);
    today = MoviesToday.fromJson(response.data);

  }

  Future _fetchRanks() async {

    Response response = await NetworkManager.get(Api.fetchRanks);
    ranks =  RankList.fromJson(response.data);

  }

}


class MoviesListViewModel extends BaseListViewModel<MovieList> {

  MoviesListViewModel(id):super(id: id);

  @override
  Api get api => Api.fetchMovieList;

  @override
  String get extra => id;

  @override
  MovieList modelFromJson(json) {
    return MovieList.fromJson(json);
  }

}
