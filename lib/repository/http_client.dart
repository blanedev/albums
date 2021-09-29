// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class HttpClient {
  Dio init() {
    Dio _dio = Dio();

    String ts = DateTime.now().millisecondsSinceEpoch.toString();
    
    _dio.interceptors.add(ApiInterceptors());
    _dio.options.baseUrl = 'https://itunes.apple.com/';
    _dio.options.queryParameters = {      
      "ts": ts,      
    };

    return _dio;
  }
}

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
    print('Started request!: ${options.path}');
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print('Some error occurred during api request: ${err.message}');
    print('Error data: ${err.response!.data}');
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // print('Response successful: $response');
    handler.resolve(response);
  }
}