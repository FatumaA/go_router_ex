import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_ex/login_info.dart';

class SharedDrawer extends StatelessWidget {
  const SharedDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: const EdgeInsets.fromLTRB(24, 42, 24, 24),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            SizedBox(
              height: 40,
              child: ElevatedButton(
                child: const Text(
                  'Sign Out',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  LoginInfo().logout();
                  // context.go('/');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
