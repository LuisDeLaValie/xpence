import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xpence/screens/tutotrial/tutorial_screen.dart';

import '../data/database/configurasion_app.dart';
import '../screens/home/home_screen.dart';
import '../screens/login/login_screen.dart';
import 'handlers/calendario_handler.dart';
import 'handlers/movimineto_handler.dart';

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
            redirect: _redirect,
            routes: [
              GoRoute(
                name: 'moviminto',
                path: "moviminto",
                builder: movimintoHandler,
                redirect: _redirect,
              ),
              GoRoute(
                  name: 'calendario',
                  path: "calendario",
                  builder: calendarioHandler,
                  redirect: _redirect,
                  routes: [
                    GoRoute(
                      name: 'planeado',
                      path: "planeado",
                      builder: planearPagosHandler,
                      redirect: _redirect,
                    ),
                  ]),
            ]),
        GoRoute(
          name: 'intro',
          path: '/intro',
          builder: introHandler,
          redirect: _redirect,
        ),
        GoRoute(
          name: 'login',
          path: "/login",
          builder: loginHandler,
          redirect: (context, state) {
            var configura = ConfiguracionApp();

            if (configura.fechaInicio == null) return null;

            return "/";
          },
        )
      ],
    );
  }
}

Future<String?> _redirect(BuildContext context, GoRouterState state) async {
  var configura = ConfiguracionApp();

  if (configura.fechaInicio != null) return null;

  return "/login";
}
