import 'package:flutter/material.dart';
import 'package:posts_app/users/widget/text_form_wisdget.dart';

class CreateUserPage extends StatelessWidget {
  const CreateUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        elevation: 0,
        title: const Text('Create User', style: TextStyle(color: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            TextFormFiledWidget(
              controller: nameController,
              hint: 'Name',
              multiLine: false,
            ),
            TextFormFiledWidget(
              controller: emailController,
              hint: 'Email',
              multiLine: false,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Gender',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text('Male'),
                  leading: IconButton(
                    onPressed: () {},
                    icon: Radio(
                        groupValue: 'male', value: 'male', onChanged: (v) {}),
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text('Female'),
                  leading: IconButton(
                    onPressed: () {},
                    icon: Radio(
                        groupValue: 'Female',
                        value: 'female',
                        onChanged: (v) {}),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Status',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text('Active'),
                  leading: IconButton(
                    onPressed: () {},
                    icon: Radio(
                        groupValue: 'male', value: 'male', onChanged: (v) {}),
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text('Inactive'),
                  leading: IconButton(
                    onPressed: () {},
                    icon: Radio(
                        groupValue: 'Female',
                        value: 'female',
                        onChanged: (v) {}),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
