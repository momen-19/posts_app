import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:posts_app/posts/post_details_page.dart';
import 'package:posts_app/posts/post_model.dart';
import 'package:posts_app/posts/posts_controller.dart';

final nameProvider = StateProvider<String>((ref) => '');

class PostsPage extends ConsumerWidget {
  const PostsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(posts);
    ref.listen<String>(nameProvider, (previous, next) { if(next != previous) {
      final snackBar = SnackBar(content: Text(next));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }});
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        elevation: 0,
        title: const NameWidget(),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              ref.read(nameProvider.state).state = 'Momen';
            },
          ),
        ],
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

class NameWidget extends ConsumerWidget {
  const NameWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameProvider);
    return Visibility(visible: name != '', child: Text(name));
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
