import 'package:flutter/material.dart';
import 'package:posts_app/users/update_page.dart';
import 'package:posts_app/users/user_controller.dart';
import 'package:posts_app/users/user_model.dart';

class UserDetails extends StatelessWidget {
  UserModel userModel;

  UserDetails({Key? key, required this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        elevation: 0,
        title:
            const Text('User Details', style: TextStyle(color: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: _buildBody(userModel,context),
    );
  }
}

_buildBody(UserModel userModel, BuildContext context) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: ListTile(
          tileColor: Colors.black12,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(userModel.name),
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(userModel.email),
              Text(userModel.gender),
              Container(
                color: userModel.status == 'active' ? Colors.green : Colors.red,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    userModel.status,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton.icon(
            onPressed: () {
            _goToUpdatePage(context);
            },
            style: ElevatedButton.styleFrom(
                primary: Colors.green.shade800
            ),
            icon: Icon(Icons.edit),
            label: Text('Edit'),
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                primary: Colors.red.shade800
            ),
            icon: Icon(Icons.delete),
            onPressed: () {

            },
            label: const Text('Delete'),
          ),
        ],
      ),
    ],
  );
}

void _goToUpdatePage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => UpdatePage(),
    ),
  );
}
