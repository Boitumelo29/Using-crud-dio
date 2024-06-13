import 'package:crudapiapp/features/crud/domain/usecase/user_usecase.dart';
import 'package:crudapiapp/features/crud/infrastructure/repository/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
