import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:posts_app/posts/post_details_page.dart';
import 'package:posts_app/posts/post_model.dart';
import 'package:posts_app/posts/posts_controller.dart';

class PostsPage extends ConsumerWidget {
  PostsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(posts);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: state.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stack) => Center(child: Text(error.toString())),
        data: (posts) => ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                tileColor: Colors.black12,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                onTap: () {
                  _goToDetailsScreen(
                    context,
                    PostModel(
                      id: posts[index].id,
                      userId: posts[index].id,
                      title: posts[index].title,
                      body: posts[index].body,
                    ),
                  );
                },
                title: Text(posts[index].title),
              ),
            );
          },
        ),
      ),
    );
  }
}

void _goToDetailsScreen(BuildContext context, PostModel postModel) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => PostDetailsPage(postModel: postModel),
    ),
  );
}
