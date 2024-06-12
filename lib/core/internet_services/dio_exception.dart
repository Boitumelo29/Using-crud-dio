import 'package:dio/dio.dart';

class DioException implements Exception{

  late String errorMessage;

  DioException.fromDioError(DioException dioError){

  }
}