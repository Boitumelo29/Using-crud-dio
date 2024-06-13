import 'package:crudapiapp/features/crud/presentaion/view_model/user_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class UserList extends ConsumerStatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  ConsumerState<UserList> createState() => _UserListState();
}

class _UserListState extends ConsumerState<UserList> {
  late UserListProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = ref.watch(getUserProvider);
    provider.init();

    return Scaffold(
        appBar: AppBar(
          title: const Text("Get User list"),
        ),
        body: provider.haveData
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: provider.list.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.network(
                                      "${provider.list[index].avatar}")),
                              title: Text('${provider.list[index].firstName}'),
                              subtitle:
                                  Text('${provider.list[index].lastName}'),
                            );
                          })
                    ],
                  ),
                ),
              )
            : const Center(child: CircularProgressIndicator()));
  }
}
