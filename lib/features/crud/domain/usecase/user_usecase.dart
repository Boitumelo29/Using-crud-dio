import 'package:crudapiapp/features/crud/domain/model/new_user.dart';
import 'package:crudapiapp/features/crud/domain/model/user.dart';
import 'package:crudapiapp/features/crud/domain/repository/user_repo.dart';

//this class will have details of external dependencies, such as data sources or APIs.
// provide a clean interface for interacting with these dependencies, allowing the use case to remain agnostic of the specific implementation details.


//We created an abstract class for the user usecase containing all the different methods we will implement.
// We also named it differently from those in the user repository to prevent any issues.
abstract class UserUseCase {
  Future<List<User>> getAllUsers();
  Future<NewUser> createNewUser(String name, String job);
  Future<NewUser> updateUserInfo(String id, String name, String job);
  Future<void> deleteUserInfo(String id);
}


//we returned the functions from the user repository,
class UserUseCaseImp extends UserUseCase {
  final UserRepository userRepository;

  UserUseCaseImp(this.userRepository);

  @override
  Future<NewUser> createNewUser(String name, String job) async {
    return await userRepository.addNewUser(name, job);
  }

  @override
  Future<void> deleteUserInfo(String id) async {
    return await userRepository.deleteUser(id);
  }

  @override
  Future<List<User>> getAllUsers() async {
    return await userRepository.getUserList();
  }

  @override
  Future<NewUser> updateUserInfo(String id, String name, String job) async {
    return await userRepository.updateUser(id, name, job);
  }
}
