import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:posts_app/network/api.dart';
import 'package:posts_app/posts/post_model.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'post_remote_data_source.g.dart';

@RestApi()
abstract class PostRemoteDataSource {
  factory PostRemoteDataSource(Dio dio, {String baseUrl}) =
      _PostRemoteDataSource;

  @GET('/posts')
  Future<List<PostModel>> getPosts();
}

final postsRemoteDataSource = Provider<PostRemoteDataSource>(
    (ref) => PostRemoteDataSource(ref.read(dio)));
