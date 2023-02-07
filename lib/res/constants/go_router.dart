import 'package:cgg_base_project/res/constants/routes_constants.dart';
import 'package:cgg_base_project/view/dash_board.dart';
import 'package:cgg_base_project/view/hospital_web_view/hospital_web_view.dart';
import 'package:cgg_base_project/view/login/login_web_view.dart';
import 'package:cgg_base_project/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter routes = GoRouter(
  initialLocation: RoutesList.hospitalView,
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
    GoRoute(
      path: RoutesList.loginWebView,
      builder: (BuildContext context, GoRouterState state) {
        return  LoginWebView ();
      },
    ),
    GoRoute(
      path: RoutesList.hospitalView,
      builder: (BuildContext context, GoRouterState state) {
        return  HospitalView();
      },
    ),
    GoRoute(
      path: RoutesList.doctorWebView,
      builder: (BuildContext context, GoRouterState state) {
        return  HospitalView();
      },
    )

  ],
);
