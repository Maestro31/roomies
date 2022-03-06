import 'package:flutter/material.dart';
import 'package:roomies/auth/ui/widgets/register_form.dart';

import '../containers/auth_layout.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = '/register';

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AuthLayout(child: RegisterForm());
  }
}
