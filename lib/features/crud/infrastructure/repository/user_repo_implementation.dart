import 'package:crudapiapp/core/internet_services/dio_client.dart';
import 'package:crudapiapp/core/internet_services/dio_exception.dart';
import 'package:crudapiapp/core/internet_services/path.dart';
import 'package:crudapiapp/features/crud/domain/model/new_user.dart';
import 'package:crudapiapp/features/crud/domain/model/user.dart';
import 'package:crudapiapp/features/crud/domain/repository/user_repo.dart';
import 'package:dio/dio.dart';

//We implemented the methods in the abstract class user repository using the GET, POST, UPDATE, and DELETE methods previously defined in the dio client class.
class UserRepoImpl implements UserRepository {
  @override
  Future<NewUser> addNewUser(String name, String job) async {
    try {
      final response = await DioClient.instance
          .post(users, data: {'name': name, 'job': job});
      return NewUser.fromJson(response);
    } on DioException catch (e) {
      var error = CustomDioException.fromDioException(e);
      throw error.errorMessage;
    }
  }

  @override
  Future<void> deleteUser(String id) async {
    try {
      await DioClient.instance.delete('$users/$id');
    } on DioException catch (e) {
      var error = CustomDioException.fromDioException(e);
      throw error.errorMessage;
    }
  }

  @override
  Future<List<User>> getUserList() async {
    try {
      final response = await DioClient.instance.get(users);
      final userList =
          (response['data'] as List).map((e) => User.fromJson(e)).toList();
      return userList;
    } on DioException catch (e) {
      var error = CustomDioException.fromDioException(e);
      throw error.errorMessage;
    }
  }

  @override
  Future<NewUser> updateUser(String id, String name, String job) async {
    try {
      final response = await DioClient.instance
          .put("$users/$id", data: {'id': id, 'name': name, 'job': job});
      return NewUser.fromJson(response);
    } on DioException catch (e) {
      var error = CustomDioException.fromDioException(e);
      throw error.errorMessage;
    }
  }
}
