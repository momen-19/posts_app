import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:posts_app/posts/posts_page.dart';
import 'package:posts_app/users/users_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: Colors.limeAccent,
        primarySwatch: Colors.blue,
      ),
      home: PostsPage(),
    );
  }
}