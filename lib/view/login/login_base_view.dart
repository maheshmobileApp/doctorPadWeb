import 'package:cgg_base_project/res/components/base_scafflod.dart';
import 'package:cgg_base_project/view/login/login_web_view.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginBaseView extends StatelessWidget {
  const LoginBaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        mobile: Container(), tablet: Container(), web: LoginWebView());
  }
}
