import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/home/home_screen.dart';
import '../screens/login/login_screen.dart';

part 'handlers/login_handler.dart';
part 'handlers/home_handler.dart';


class RouterXpence {
  late GoRouter router;

  void start() {
    router = GoRouter(
      initialLocation: "/",
      routes: [
        
        GoRoute(
          name: 'home',
          path: "/",
          builder: homeHandler,
          // redirect: _redirect,
        ),
        
        GoRoute(
          name: 'login',
          path: "/login",
          builder: loginHandler,
        )
      ],
    );
  }
}