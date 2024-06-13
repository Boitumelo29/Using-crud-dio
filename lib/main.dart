import 'package:crudapiapp/features/crud/presentaion/screens/user_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


//the github repo https://github.com/nikkieke/dio_tutorial?ref=hackernoon.com
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserList(),
    );
  }
}
