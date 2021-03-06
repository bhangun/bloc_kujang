import 'package:dio/dio.dart';
import 'package:f_logs/f_logs.dart';
import 'package:bloc_kujang/utils/config.dart';

import '../auth_jwt_services.dart';
import 'rest_error_util.dart';

class RestServices {
  static Dio _dio = Dio()
    ..options.baseUrl = API
    ..options.connectTimeout = TIMEOUT_CONNECTION
    ..options.receiveTimeout = TIMEOUT_RECEIVE
    ..interceptors.clear()
    ..interceptors.add(LogInterceptor(
        requestBody: true,
        request: true,
        requestHeader: true,
        responseHeader: true,
        responseBody: true))
    ..interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options,
            RequestInterceptorHandler requestHandler) async {
          FLog.info(text: options.baseUrl.toString());
          try {
            String token = (await AuthServices.fetchToken());
            if (token != '') {
              options.headers["Authorization"] = "Bearer " + token;
            }
          } catch (e) {
            FLog.info(text: e.toString());
          }
        },
        onResponse:
            (Response<dynamic> e, ResponseInterceptorHandler responseHandler) =>
                {FLog.info(text: '+++++++++++++++++++++++')
                  //FLog.info(text: e.toString());
                  },
        onError: (DioError error, ErrorInterceptorHandler errorHandler) async {
          FLog.info(text: DioErrorUtil.handleError(error));
          // Do something with response error
          if (error.response?.statusCode == 403) {
            // requestLock.lock()-> If no token, request token firstly and lock this interceptor
            // to prevent other request enter this interceptor.
            _dio.interceptors.requestLock.lock();
            _dio.interceptors.responseLock.lock();
          }
        }));

  // Get:-----------------------------------------------------------------------
  static Future<dynamic> fetch(String uri) async {
    try {
      Response response = await _dio.get(uri);
      return response.data;
    } catch (e) {
      FLog.error(text: e.toString());
      throw e;
    }
  }

  // Post:----------------------------------------------------------------------
  static Future<dynamic> post(String uri, dynamic data) async {
    FLog.info(text: uri + data);
    
    _dio.post(uri, data: data).then((value) => print(value.data.toString()));

    Response response = await _dio.post(uri, data: data);
    FLog.info(text: response.data.toString());
    return response.data;
  }

  // Post:----------------------------------------------------------------------
  static Future<dynamic> delete(String uri, dynamic id) async {
    try {
      Response response = await _dio.delete(uri, data: id);
      return response.data;
    } catch (e) {
      FLog.error(text: e.toString());
      throw e;
    }
  }

  // Post:----------------------------------------------------------------------
  static Future<dynamic> put(String uri, dynamic data) async {
    try {
      Response response = await _dio.put(uri, data: data);
      return response.data;
    } catch (e) {
      // FLog.error(text: e.toString());
      throw e;
    }
  }
}
