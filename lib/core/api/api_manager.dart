import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class ApiManager {
  late Dio _dio;

  ApiManager()
      : _dio = Dio(BaseOptions(
          baseUrl: AppConstants.baseUrl,
          contentType: 'application/json',
        ));

  Future<Response> getData(String endpoint, Map<String, dynamic> query) async {
    try {
      return await _dio.get(endpoint, queryParameters: query);
    } on DioError catch (e) {
      throw Exception("Failed to Get:$e");
    }
  }

  Future<Response> postData(String endpoint, Map<String, dynamic> body) async {
    try {
      return await _dio.post(endpoint, data: body);
    } on DioError catch (e) {
      throw Exception("Failed to Post:$e");
    }
  }
}
