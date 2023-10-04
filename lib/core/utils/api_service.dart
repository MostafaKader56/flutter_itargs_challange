import 'package:dio/dio.dart';
import '../functions/functions.dart';

import '../repo/shared_pref_helper.dart';

class ApiService {
  final _baseUrl = 'https://api.quran.com/api/v4/';
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint',
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Accept-Language': Functions.isArabic() ? 'ar' : 'en',
            'Authorization': 'Bearer ${SharedPrefsHelper.getToken()}',
          },
        ));
    return response.data;
  }

  Future<dynamic> getMp3ByUrl({required String mp3Url}) async {
    Response response = await _dio.get(
      mp3Url,
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Accept-Language': Functions.isArabic() ? 'ar' : 'en',
          'Authorization': 'Bearer ${SharedPrefsHelper.getToken()}',
        },
        responseType: ResponseType.bytes,
      ),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> post(
      {required String endPoint, Object? params}) async {
    var response = await _dio.post('$_baseUrl$endPoint',
        data: params,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/x-www-form-urlencoded',
            'Accept-Language': Functions.isArabic() ? 'ar' : 'en',
            'Authorization': 'Bearer ${SharedPrefsHelper.getToken()}',
          },
        ));
    return response.data;
  }

  Future<Map<String, dynamic>> put(
      {required String endPoint, Object? params}) async {
    var response = await _dio.put('$_baseUrl$endPoint',
        data: params,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Accept-Language': Functions.isArabic() ? 'ar' : 'en',
            'Authorization': 'Bearer ${SharedPrefsHelper.getToken()}',
          },
        ));
    return response.data;
  }

  Future<Map<String, dynamic>> delete(
      {required String endPoint, Object? params}) async {
    var response = await _dio.delete('$_baseUrl$endPoint',
        data: params,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Accept-Language': Functions.isArabic() ? 'ar' : 'en',
            'Authorization': 'Bearer ${SharedPrefsHelper.getToken()}',
          },
        ));
    return response.data;
  }
}
