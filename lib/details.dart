// temp for router demo only - details should load blogs from supabase db instead
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'drawer.dart';
import 'post.model.dart';

class DetailScreen extends StatelessWidget {
  final Post post;
  const DetailScreen({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      drawer: const SharedDrawer(),
      body: SizedBox(
        width: 800,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 12),
              child: Text(
                post.title as String,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70),
              ),
            ),
            Text(
              post.subtitle ?? '',
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white70),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              post.body!,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.white70),
            ),
            const SizedBox(
              height: 100,
            ),
            SizedBox(
              height: 40,
              child: ElevatedButton(
                child: const Text(
                  'Go Back',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  context.go('/home');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
