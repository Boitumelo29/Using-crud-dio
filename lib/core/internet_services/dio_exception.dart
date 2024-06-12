import 'package:dio/dio.dart';

class CustomDioException implements Exception {
  late String errorMessage;

  CustomDioException.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.cancel:
        errorMessage = "Request to server was canceleld";
        break;
      case DioExceptionType.connectionTimeout:
        errorMessage = "Connection timed out";
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = "Request send timeout";
        break;
      case DioExceptionType.badResponse:
        errorMessage = _handleStatusCode(dioException.response?.statusCode);
        break;
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          errorMessage = 'No Internet';
          break;
        }
        errorMessage = "Unexpected error occurred.";
        break;
      default:
        errorMessage = "Something Wrong Happened";
        break;
    }
  }

  String _handleStatusCode(int? statusCode) {
    return "";
  }
}
