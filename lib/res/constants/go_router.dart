import 'package:cgg_base_project/res/constants/routes_constants.dart';
import 'package:cgg_base_project/view/dash_board.dart';
import 'package:cgg_base_project/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter routes = GoRouter(
  initialLocation: RoutesList.login,
  routes: <RouteBase>[
    GoRoute(
        path: RoutesList.login,
        builder: (BuildContext context, GoRouterState state) {
          return const LoginView();
        }),
    GoRoute(
      path: RoutesList.dashBoard,
      builder: (BuildContext context, GoRouterState state) {
        return const DashBoardView();
      },
    ),
  ],
);
