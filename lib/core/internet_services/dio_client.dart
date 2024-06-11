import 'package:crudapiapp/core/internet_services/path.dart';
import 'package:dio/dio.dart';

/// Create a singleton class to contain all Dio methods and helper functions
/// Created a singleton class For DioClient which will ensure that only one instance of the class can exist throughout the application and provides a global point of access to that instance.
class DioClient {
  ///._(); this means the constructor is private
  DioClient._();

  static final instance = DioClient._();

  final Dio _dio = Dio(
    BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        responseType: ResponseType.json),
  );

  ///The Get Method
  Future<Map<String, dynamic>> get(String path,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress}) async {
    try {
      final Response response = await _dio.get(path,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress);

      if (response.statusCode == 200) {
        return response.data;
      }
      throw "Something went wrong trying to get";
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  ///Post Method

  Future<Map<String, dynamic>> post(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    try {
      final Response response = await _dio.post(path,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress);
      //201 = created
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
      throw "Something went wrong trying to post";
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  ///Put Method
  Future<Map<String, dynamic>> put(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    try {
      final Response response = await _dio.put(path,
          data: data,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
          onSendProgress: onSendProgress);

      if (response.statusCode == 200) {
        return response.data;
      }
      throw "Something went wrong with the post";
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  ///Delete Method
  Future<Map<String, dynamic>> delete(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    final Response response = await _dio.delete(path,
        data: data,
        options: options,
        cancelToken: cancelToken,
        queryParameters: queryParameters);

    if (response.statusCode == 200) {
      return response.data;
    }
    throw "";
  }
}
