import 'package:crudapiapp/features/crud/domain/model/user.dart';
import 'package:crudapiapp/features/crud/infrastructure/repository/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserListProvider extends ChangeNotifier {
  late final ChangeNotifierProviderRef ref;

  List<User> list = [];
  bool haveData = false;

  UserListProvider({required this.ref});

  Future<void> init() async {
    list = await ref.watch(userListProvider).getUserList();
    haveData = true;
    notifyListeners();
  }
}

final getUserProvider = ChangeNotifierProvider<UserListProvider>(
    (ref) => UserListProvider(ref: ref));
