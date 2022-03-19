import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'drawer.dart';
import 'post.model.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final List<Post> posts = [
    Post(1, "Post One", "Post one subtitle", "post one body"),
    Post(2, "Post Two", "Post two subtitle", "post two body"),
    Post(3, "Post Three", "Post three subtitle", "post three body"),
    Post(4, "Post Four", "Post four subtitle", "post four body"),
    Post(5, "Post Five", "Post five subtitle", "post five body"),
    Post(6, "Post Six", "Post six subtitle", "post six body"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: const SharedDrawer(),
      body: SizedBox(
        width: 800,
        child: Center(
          child: ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: const Icon(
                    Icons.book,
                    size: 48,
                    color: Color.fromRGBO(38, 140, 166, 1),
                  ),
                  title: Text(
                    posts[index].title!,
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70),
                  ),
                  subtitle: Text(
                    posts[index].subtitle ?? '',
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white70),
                  ),
                  onTap: () => context.goNamed('details', params: {'id': posts[index].id.toString()}),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  tileColor: Colors.grey[800],
                  contentPadding: const EdgeInsets.all(20),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
