import 'package:flutter/material.dart';
import 'package:posts_app/users/user_controller.dart';
import 'package:posts_app/users/user_model.dart';

class UserDetails extends StatelessWidget {
  UserModel userModel;

  UserDetails({Key? key, required this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: _buildBody(userModel),
    );
  }
}

_buildBody(UserModel userModel) {
  return ListTile(
    tileColor: Colors.black12,
    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(userModel.status,style: TextStyle(color: Colors.white)),
          ),
          color: userModel.status == 'active' ? Colors.green : Colors.red,
        ),
      ],
    ),
  );
}
