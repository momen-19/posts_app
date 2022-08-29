import 'package:posts_app/posts/post_model.dart';
import 'package:posts_app/posts/post_remote_data_source.dart';
import 'package:riverpod/riverpod.dart';

final posts = FutureProvider.autoDispose<List<PostModel>>(
  (ref) async => ref.watch(postsRemoteDataSource).getPosts(),
);
