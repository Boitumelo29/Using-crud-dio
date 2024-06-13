import 'package:crudapiapp/features/crud/domain/usecase/user_usecase.dart';
import 'package:crudapiapp/features/crud/infrastructure/repository/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


//ith this provider, we can have access to the user usecase implementation class which will in turn allow us access the user repository implementation providers that we created earlier.
final usersListProvider = Provider<UserUseCase>((ref) {
  return UserUseCaseImp(ref.read(userListProvider));
});

final createUserProvider = Provider<UserUseCase>((ref) {
  return UserUseCaseImp(ref.read(newUserProvider));
});

final updateUserData = Provider<UserUseCase>((ref) {
  return UserUseCaseImp(ref.read(updateUserProvider));
});

final deleteUserDataProvider = Provider<UserUseCase>((ref) {
  return UserUseCaseImp(ref.read(deleteUserProvider));
});
