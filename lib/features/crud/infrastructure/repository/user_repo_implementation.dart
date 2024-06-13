import 'package:crudapiapp/core/internet_services/dio_client.dart';
import 'package:crudapiapp/features/crud/domain/model/new_user.dart';
import 'package:crudapiapp/features/crud/domain/repository/user_repo.dart';

class UserRepoImpl implements UserRepository {


  @override
  Future<NewUser> addNewUser(String name, String job) async {
    try {
      final response = await DioClient.instance
          .post(users, data: {'name': name, 'job': job});
      return NewUser.fromJson(response);
    } catch (e) {
      print(e);
    }
  }
}

// try{}catch(e){
//       print(e);
//     }