import 'package:flutter/material.dart';
import 'package:posts_app/posts/post_model.dart';

class PostDetailsPage extends StatelessWidget {
  PostModel postModel;

  PostDetailsPage({
    Key? key,
    required this.postModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Details'),
      ),
      body: _buildBody(postModel),
    );
  }
}

_buildBody(PostModel postModel) {
  return ListTile(
    tileColor: Colors.black12,
    contentPadding: const EdgeInsets.symmetric(vertical: 10),
    title: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8),
        color: Colors.black26,
        child: Text(
          postModel.title,
        ),
      ),
    ),
    subtitle: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(postModel.body),
    ),
    leading: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(postModel.id.toString()),
    ),
  );
}
