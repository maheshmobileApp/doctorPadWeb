import 'package:cgg_base_project/res/constants/routes_constants.dart';
import 'package:cgg_base_project/view/dash_board.dart';
import 'package:cgg_base_project/view/hospital_view/hospital_view.dart';
import 'package:cgg_base_project/view/login/login_web_view.dart';
import 'package:cgg_base_project/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../view/add_doctor_successfully/add_doctor_successfully.dart';
import '../../view/add_hospital_successfully/add_hospital_successfully.dart';
import '../../view/doctor_details/doctor_details.dart';
import '../../view/add_doctor/add_doctor.dart';
import '../../view/doctor_view/doctor_view.dart';
import '../../view/add_hospital/add_hospital.dart';
import '../../view/hospital__details/hospital_details.dart';

final GoRouter routes = GoRouter(
  initialLocation: RoutesList.loginWebView,
  routes: <RouteBase>[
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
      path: RoutesList.hospitalWebDetails,
      builder: (BuildContext context, GoRouterState state) {
        return  HospitalWebDetails();
      },
    ),
    GoRoute(
      path: RoutesList. hospitalDetails,
      builder: (BuildContext context, GoRouterState state) {
        return   HospitalDetails ();
      },
    ),
    GoRoute(
      path: RoutesList.doctorWebView,
      builder: (BuildContext context, GoRouterState state) {
        return  DoctorWebView();
      },
    ),
    GoRoute(
      path: RoutesList. doctorAddDetails,
      builder: (BuildContext context, GoRouterState state) {
        return   DoctorAddDetails();
      },
    ),
    GoRoute(
      path: RoutesList.doctorDetails,
      builder: (BuildContext context, GoRouterState state) {
        return  DoctorDetails();
      },
    ),
    GoRoute(
      path: RoutesList. addDoctorSuccessfully,
      builder: (BuildContext context, GoRouterState state) {
        return   AddDoctorSuccessfully();
      },
    ),
    GoRoute(
      path: RoutesList. addHospitalSuccessfully,
      builder: (BuildContext context, GoRouterState state) {
        return   AddHospitalSuccessfully();
      },
    ),
  ],
);
