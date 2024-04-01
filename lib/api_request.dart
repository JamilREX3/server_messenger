

import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';






class ApiRequest {
  final _dio = dio.Dio();

  Future<dio.Response> get(
      {authRequire = true,
        @required path,
        dynamic body,
        Map<String, dynamic>? query,
        bool showSnackBar = true}) async {
    dio.Response finalResponse;
    var staticUrl = GetStorage().read('staticUrl');
    try {
      dio.Options options = dio.Options();
      String language = GetStorage().read('language') == 'ar' ? 'ar' : 'en';
      query ??= {};
      query['lang'] = language;
      if (authRequire == true) {
        String token = await GetStorage().read('token');

        //todo add z var
        options = dio.Options(headers: {'Authorization': 'Bearer $token' , 'smsz':'abababa185ac6d6ea0a1c'});
      }




      dio.Response response = await _dio.get(
        staticUrl.toString() + path,
        data: body,
        queryParameters: query,
        options: options,
      );
      print(response.realUri);
      finalResponse = response;
    } on dio.DioException catch (e) {
      if (e.response != null) {
        finalResponse = e.response!;
      } else {
        finalResponse = dio.Response(
          statusCode: 500,
          data: {'message': 'An error occurred'},
          requestOptions: dio.RequestOptions(path: staticUrl.toString() + path),
        );
      }
    }
    if (showSnackBar == true) {
    }
    return finalResponse;
  }

  Future<dio.Response> post(
      {authRequire = true,
        @required path,
        dynamic body,
        Map<String, dynamic>? params}) async {
    dio.Response finalResponse;
    var staticUrl = GetStorage().read('staticUrl');
    try {
      dio.Options options = dio.Options();

      if (authRequire == true) {
        String token = await GetStorage().read('token');
        //todo add z var
        options = dio.Options(headers: {'Authorization': 'Bearer $token' , 'smsz':'abababa185ac6d6ea0a1c'});
      } else {}
      dio.Response response = await _dio.post(
        staticUrl.toString() + path,
        data: body,
        queryParameters: params,
        options: options,
      );

      finalResponse = response;
    } on dio.DioException catch (e) {
      if (e.response != null) {
        finalResponse = e.response!;
      } else {
        finalResponse = dio.Response(
          statusCode: 500,
          data: {'message': 'An error occurred'},
          requestOptions: dio.RequestOptions(path: staticUrl.toString() + path),
        );
      }
    }
    return finalResponse;
  }

}
