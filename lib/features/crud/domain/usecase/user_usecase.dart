import 'package:crudapiapp/features/crud/domain/model/new_user.dart';
import 'package:crudapiapp/features/crud/domain/model/user.dart';

//this class will have details of external dependencies, such as data sources or APIs.
// provide a clean interface for interacting with these dependencies, allowing the use case to remain agnostic of the specific implementation details.

abstract class UserUsecase {
  Future<List<User>> getAllUsers();
  Future<NewUser> createNewUser(String name, String job);
  Future<NewUser> updateUserInfo(String id, String name, String job);
  Future<void> deleteUserInfo(String id);
}

class UserUseCaseImp extends UserUsecase{

}

