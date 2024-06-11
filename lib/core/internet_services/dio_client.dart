import 'package:crudapiapp/core/internet_services/path.dart';
import 'package:dio/dio.dart';

/// Create a singleton class to contain all Dio methods and helper functions
class DioClient {
  DioClient._();

  static final instance = DioClient._();

  final Dio _dio = Dio(
    BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        responseType: ResponseType.json),
  );
}

///The Get Method
Future<Map<String, dynamic>> get(String path,
    {Map<String, dynamic>? queryQarameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress}) async {
  try {
    final Response response = await _dio.get(path,
        queryQarameters: queryQarameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress);

    if (response.statusCode == 200) {
      return response.data;
    }
    throw "Something went wrong";
  } catch (e) {
    print(e);
    rethrow;
  }
}
