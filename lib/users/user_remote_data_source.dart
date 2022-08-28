import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:posts_app/network/api.dart';
import 'package:posts_app/users/user_model.dart';
import 'package:retrofit/http.dart';

part 'user_remote_data_source.g.dart';

@RestApi()
abstract class UserRemoteDataSource {
  factory UserRemoteDataSource(Dio dio, {String baseUrl}) =
      _UserRemoteDataSource;

  @GET('/users')
  Future<List<UserModel>> getUsers();

  @GET('/users/{id}')
  Future<List<UserModel>> getUserWithId(@Path("id") int id);
}

final usersRemoteDataSource = Provider<UserRemoteDataSource>(
  (ref) => UserRemoteDataSource(
    ref.read(dio),
  ),
);
