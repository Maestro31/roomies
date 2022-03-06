import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:roomies/ui/validators/index.dart';
import 'package:roomies/ui/widgets/spaced_column.dart';

import '../../../core/auth/models/auth_status.dart';
import '../../blocs/auth/auth_bloc.dart';
import '../screens/register_screen.dart';

class LoginFormData {
  final String email;
  final String password;

  LoginFormData({required this.email, required this.password});
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  void onSubmit(BuildContext context, LoginFormData data) {
    var event = AuthLoginSubmitted(
      email: data.email,
      password: data.password,
    );
    context.read<AuthBloc>().add(event);
  }

  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SpacedColumn(
              columnGap: 20,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: FlutterI18n.translate(context, 'login_screen.placeholders.email'),
                  ),
                  controller: emailController,
                  validator: emailValidator,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: FlutterI18n.translate(context, 'login_screen.placeholders.password'),
                  ),
                  obscureText: true,
                  controller: passwordController,
                  validator: nonEmptyValidator,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(RegisterScreen.routeName);
                  },
                  child: I18nText('login_screen.cta.signup'),
                ),
              ],
            ),
            BlocSelector<AuthBloc, AuthState, AuthStatus>(
              selector: (state) => state.status,
              builder: (context, status) => status == AuthStatus.pending
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          var data = LoginFormData(
                            email: emailController.text,
                            password: passwordController.text,
                          );

                          widget.onSubmit(context, data);
                        }
                      },
                      child: I18nText('login_screen.cta.signin'),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
