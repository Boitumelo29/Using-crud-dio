import 'package:crudapiapp/features/crud/domain/model/new_user.dart';
import 'package:crudapiapp/features/crud/domain/model/user.dart';

//contain all the different methods to be implemented for GET, POST, PUT, and, DELETE.
abstract class UserRepository{
  Future<List<User>>getUserList();
  Future<NewUser>addNewUser(String name, String job);
  Future<NewUser>updateUser(String id, String name, String job);
  Future<void>deleteUser(String id);
}