import 'package:cgg_base_project/res/components/base_scafflod.dart';
import 'package:cgg_base_project/res/styles/login_styles.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Hello ",
          style: nameTextStyle,
        )
      ],
    ));
  }
}


//view->view_model->repository->baseClients