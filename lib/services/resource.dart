// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:fuelmetrics_flutter_project/routes/api-routes.dart';
import 'package:fuelmetrics_flutter_project/services/storage.dart';

class ResourceService {
  Dio _dio = new Dio();
  String? baseUrl = '';
  String? contentType;

  ResourceService({this.baseUrl, this.contentType}) {
    // _baseUrl = AppUrl.apiBaseUrl!; //put base url here
    this._dio.options.baseUrl = this.baseUrl ?? ApiUrl.baseUrl;
    this._dio.options.connectTimeout = 60 * 1000; // 60 seconds
    this._dio.options.receiveTimeout = 60 * 1000; // 60 seconds
    this._dio.options.contentType = this.contentType ?? 'application/json';
    this._dio.interceptors.add(TokenInterceptors(this._dio));
  }

  Future<Response> request(String endpoint,
      {dynamic body, String? method}) async {
    var res = _dio.request(endpoint,
        data: body,
        options: Options(
            method: method,
            followRedirects: false,
            validateStatus: (status) {
              //use this to make sure to return every other status code as a response except 500
              return status! < 500;
            }));

    print('request uri = ${this._dio.options.baseUrl}$endpoint');
    return res;
  }
}

class TokenInterceptors extends Interceptor {
  final Dio _dio;

  TokenInterceptors(this._dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    //use this check to exclude endpoints that do not use token header
    if (!ApiUrl.openUrls.contains(options.path.toLowerCase())) {
      _dio.interceptors.requestLock.lock();
      final token = await Storage.read('token');
      if (token != null && token.isNotEmpty) {
        // Set the header
        options.headers['Authorization'] = 'Bearer $token';
      }

      _dio.interceptors.requestLock.unlock();
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
        'RESPONSE[${response.statusCode} - ${response.statusMessage}] => PATH: ${response.realUri.path}');
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.response?.realUri.path}');
    return super.onError(err, handler);
  }
}
