import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:roomies/ui/validators/index.dart';
import 'package:roomies/ui/widgets/spaced_column.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../../core/auth/models/auth_status.dart';
import '../screens/login_screen.dart';

class RegisterFormData {
  final String email;
  final String firstName;
  final String lastName;
  final String password;

  RegisterFormData(
      {required this.email,
      required this.firstName,
      required this.lastName,
      required this.password});
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  void onSubmit(BuildContext context, RegisterFormData data) {
    var event = AuthRegistrationSubmitted(
      email: data.email,
      firstName: data.firstName,
      lastName: data.lastName,
      password: data.password,
    );
    context.read<AuthBloc>().add(event);
  }

  @override
  RegisterFormState createState() {
    return RegisterFormState();
  }
}

class RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
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
                    hintText: FlutterI18n.translate(
                      context,
                      'register_screen.placeholders.email',
                    ),
                  ),
                  controller: emailController,
                  validator: emailValidator,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: FlutterI18n.translate(
                      context,
                      'register_screen.placeholders.firstname',
                    ),
                  ),
                  controller: firstNameController,
                  validator: nonEmptyValidator,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: FlutterI18n.translate(
                      context,
                      'register_screen.placeholders.lastname',
                    ),
                  ),
                  controller: lastNameController,
                  validator: nonEmptyValidator,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: FlutterI18n.translate(
                      context,
                      'register_screen.placeholders.password',
                    ),
                  ),
                  obscureText: true,
                  controller: passwordController,
                  validator: nonEmptyValidator,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: FlutterI18n.translate(
                      context,
                      'register_screen.placeholders.confirm_password',
                    ),
                  ),
                  obscureText: true,
                  controller: passwordConfirmationController,
                  validator: nonEmptyValidator,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
                  },
                  child: I18nText('register_screen.cta.signin'),
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
                          var data = RegisterFormData(
                            email: emailController.text,
                            firstName: firstNameController.text,
                            lastName: lastNameController.text,
                            password: passwordController.text,
                          );

                          widget.onSubmit(context, data);
                        }
                      },
                      child: I18nText('register_screen.cta.signup'),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
