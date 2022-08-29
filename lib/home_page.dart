import 'package:flutter/material.dart';
import 'package:posts_app/posts/posts_page.dart';
import 'package:posts_app/users/users_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        elevation: 0,
        title: const Text('Home', style: TextStyle(color: Colors.black)),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserPage(),
                ),
              );
            },
            leading: const Icon(Icons.person),
            title: const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'Users',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            subtitle: const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text('List of users in app'),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostsPage(),
                ),
              );
            },
            leading: const Icon(Icons.list_alt),
            title: const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'Posts',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            subtitle: const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text('List of posts in app'),
            ),
          ),
        ],
      ),
    );
  }
}
