import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:posts_app/users/user_model.dart';
import 'package:posts_app/users/user_remote_data_source.dart';

final users = FutureProvider.autoDispose<List<UserModel>>(
  (ref) async => ref.watch(usersRemoteDataSource).getUsers(),
);


