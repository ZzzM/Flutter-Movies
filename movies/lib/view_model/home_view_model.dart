import 'package:dio/dio.dart';
import 'package:movies/model/home_model.dart';
import 'package:movies/model/movie_model.dart';
import 'package:movies/util/network_manager.dart';

import 'base_view_model.dart';

class HomeViewModel extends BaseViewModel {

  List<MovieList> lists;

  HomeViewModel() {
    onRefresh();
  }

  @override
  onRefresh() {

    setViewState(ViewState.onRefresh);
    Future.wait([
      _fetch('movie_showing'),
      _fetch('movie_hot_gaia'),
      _fetch('tv_hot'),
      _fetch('tv_variety_show'),
    ]).then((result) {
      lists = result;
      setViewState(ViewState.refreshCompleted);
      if (isEmpty) {
        setViewState(ViewState.empty, message:'refresh.empty');
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
  bool get isEmpty => lists.isEmpty;

  @override
  Api get api => Api.fetchMovieList;

  @override
  get param => {'start': 0, 'count': 6};


  Future<MovieList> _fetch(String extra) async {
    Response response = await NetworkManager.get(api,
        extra: extra,
        param: param);

    return MovieList.fromJson(response.data);
  }


}


class HomeSearchViewModel extends BaseListViewModel<HomeSearchList> {

  final String tag, type;

  HomeSearchViewModel(this.tag, this.type);

  @override
  int get count => 20;

  @override
  get param => {
    'page_start': start,
    'page_limit': count,
    'tag': tag,
    'type': type
  };

  @override
  bool get loadNoData {
    return pageSize < count;
  }

  @override
  Api get api => Api.fetchSearchList;

  @override
  HomeSearchList modelFromJson(json) {
    return HomeSearchList.fromJson(json);
  }

}