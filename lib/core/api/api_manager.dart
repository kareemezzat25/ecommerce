import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@LazySingleton()
class ApiManager {
  late Dio _dio;

  ApiManager() {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseUrl,
        contentType: 'application/json',
      ),
    );
    _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        error: true));
  }
  Future<Response> getData(String endpoint,
      {Map<String, dynamic>? query, Map<String, dynamic>? headers}) async {
    try {
      return await _dio.get(endpoint,
          queryParameters: query, options: Options(headers: headers));
    } on DioError catch (e) {
      throw Exception("Failed to Get:$e");
    }
  }

  Future<Response> postData(String endpoint, Map<String, dynamic> body,
      {Map<String, dynamic>? headers}) async {
    try {
      return await _dio.post(endpoint,
          data: body, options: Options(headers: headers));
    } on DioError catch (e) {
      throw Exception("Failed to Post:$e");
    }
  }
}
