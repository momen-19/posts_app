import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:posts_app/users/user_controller.dart';
import 'package:posts_app/users/user_details.dart';
import 'package:posts_app/users/user_model.dart';

class UserPage extends ConsumerWidget {
  const UserPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(users);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: state.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stack) => Center(child: Text(error.toString())),
        data: (users) => ListView.builder(
          padding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 5,
          ),
          itemCount: users.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () =>_goToDetailsUser(
                  context,
                  UserModel(
                    id: users[index].id,
                    name: users[index].name,
                    email: users[index].email,
                    gender: users[index].gender,
                    status: users[index].status,
                  ),
                ),
                tileColor: Colors.black12,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 8,
                ),
                title: Text(users[index].name),
              ),
            );
          },
        ),
      ),
    );
  }
}


void _goToDetailsUser(BuildContext context, UserModel userModel) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => UserDetails(userModel: userModel),
    ),
  );
}

