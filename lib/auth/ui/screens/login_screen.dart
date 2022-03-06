import 'package:flutter/material.dart';

import '../containers/auth_layout.dart';
import '../widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AuthLayout(child: LoginForm());
  }
}
