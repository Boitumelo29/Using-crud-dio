import 'package:crudapiapp/features/crud/domain/repository/user_repo.dart';
import 'package:crudapiapp/features/crud/infrastructure/repository/user_repo_implementation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///we will create a provider class using Riverpod for this user repository implementation class. It provides a global point of access for the class.

final userListProvider = Provider<UserRepository>((ref) {
  return UserRepoImpl();
});

final newUserProvider = Provider<UserRepository>((ref) {
  return UserRepoImpl();
});

final updateUserProvider = Provider<UserRepository>((ref) {
  return UserRepoImpl();
});
