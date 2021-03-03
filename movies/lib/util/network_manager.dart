import 'package:dio/dio.dart';
import 'constant.dart';



class NetworkManager {

  static get cancelToken => CancelToken();

  static Future<Response> get(Api api, {String extra, CancelToken cancelToken, Map<String, dynamic> param}) async {

    final options = api.options;
    final path = api.path(extra);
    final queryParameters = api.queryParameters(param);

    return await Dio(options).get(path, cancelToken: cancelToken, queryParameters: queryParameters);

  }


  static Future<Response> download(String url, String savePath, {CancelToken cancelToken, ProgressCallback onReceiveProgress}) async {
    return await Dio().download(url, savePath,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress);
  }


  static Future<int> contentLength(String url, {CancelToken cancelToken}) async {
    final req =  await Dio().head(url, cancelToken: cancelToken);
    return int.parse(req.headers[Headers.contentLengthHeader].first) ?? 0;
  }

  static cancel(CancelToken cancelToken) {
    cancelToken.cancel();
  }

}

enum Api {
  fetchMovieList,
  fetchDetail,
  fetchRanks,
  fetchSearchResults,
  fetchSearchSuggestions,
  fetchToday
}

extension ApiExtension on Api {

  static const Apikey = '';


  BaseOptions get options {
    return BaseOptions(
        baseUrl: BaseUrl.frodo,
        headers: {
          'User-Agent': ''
        },
        connectTimeout: 5000,
        receiveTimeout: 3000);
  }


  String path(String extra) {

    switch (this) {
      case Api.fetchSearchResults: return '/search';
      case Api.fetchSearchSuggestions: return '/movie/suggestion';
      case Api.fetchDetail: return extra.replaceAll('.', '/');
      case Api.fetchMovieList: return '/subject_collection/$extra/items';
      case Api.fetchRanks: return '/movie/rank_list';
      case Api.fetchToday: return '/calendar/today';

      default: return '';
    }

  }

  Map<String, dynamic> queryParameters(Map<String, dynamic> param) {

    Map<String, dynamic> _param = {'apikey': Apikey};
    _param.addAll(param ?? {});

    return _param;

  }

}

extension IntExtension on int {
  String get mb {
    return (this / 1024 / 1024).toStringAsFixed(2);
  }
}