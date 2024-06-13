import 'package:crudapiapp/features/crud/domain/model/user.dart';
import 'package:crudapiapp/features/crud/infrastructure/repository/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


//using the ChangeNotifierProvider, we can access the UserListProvider class and use it to feed the UI.
class UserListProvider extends ChangeNotifier {
  late final ChangeNotifierProviderRef ref;

  List<User> list = [];
  bool haveData = false;

  UserListProvider({required this.ref});
//init loads the list of users using the use case provider
  Future<void> init() async {
    list = await ref.watch(userListProvider).getUserList();
    haveData = true;
    notifyListeners();
  }
}

final getUserProvider = ChangeNotifierProvider<UserListProvider>(
    (ref) => UserListProvider(ref: ref));
