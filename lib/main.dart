import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_ex/login.dart';
import 'package:google_fonts/google_fonts.dart';

import 'details.dart';
import 'home.dart';
import 'login_info.dart';
import 'post.model.dart';

void main() async {
  runApp(
    MyApp(),
  );
}

// flutter run -d chrome --web-port=3000

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final logInInfo = LoginInfo();

  late final _router = GoRouter(
    refreshListenable: logInInfo,
    urlPathStrategy: UrlPathStrategy.path,
    // initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LogInScreen(),
      ),
      GoRoute(
        name: 'home',
        path: '/home',
        builder: (context, state) => Home(),
        routes: [
          GoRoute(
            name: 'details',
            path: ':id',
            builder: (context, state) {
              final post = getPost(state.params['id']!);
              return DetailScreen(post: post);
            },
          ),
        ],
      ),
    ],
    redirect: (state) {
      final loggedIn = logInInfo.loggedIn;
      final goingToLogin = state.location == '/';

      // the user is not logged in and not headed to /login, they need to login
      if (!loggedIn && !goingToLogin) return '/';

      // the user is logged in and headed to /login, no need to login again
      if (loggedIn && goingToLogin) return '/home';

      // no need to redirect at all
      return null;
    },
  );

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
        title: 'Supa Blog',
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.teal,
          textTheme: GoogleFonts.nunitoTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
      );
}

Post getPost(String id) {
  return Home().posts.where((post) => post.id.toString() == id).first;
}
