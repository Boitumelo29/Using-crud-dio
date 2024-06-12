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
    switch (statusCode) {
      //400 Bad Request
      case 400:
        return 'User already exist';
      //401 Unauthorized
      case 401:
        return "Authentication failed";
      //403 Forbidden
      case 403:
        return "The authenticated user is not allowed to access the specif API";
      //404 Not Found
      case 404:
        return "The requested resources does not exist";
      //500 Internal Server Error
      case 500:
        return "Internal server error";
      default:
        return "Oops something went wrong";
    }
  }

  @override
  String toString() => errorMessage;
}
