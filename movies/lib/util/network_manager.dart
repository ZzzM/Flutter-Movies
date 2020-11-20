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
  fetchMovie,
  fetchRanks,
  fetchSearchList
}

extension ApiExtension on Api {

  static const Apikey = '';


  BaseOptions get options {
    return BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 5000,
        receiveTimeout: 3000);
  }

  String get baseUrl {
    switch (this) {
      case Api.fetchSearchList: return BaseUrl.v1;
      default: return BaseUrl.v2;
    }
  }

  String path(String extra) {

    switch (this) {


      default: return '';
    }

  }

  Map<String, dynamic> queryParameters(Map<String, dynamic> param) {

    if (this == Api.fetchSearchList) {
      return param ?? {};
    }

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