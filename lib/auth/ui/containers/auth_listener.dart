import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/auth/models/auth_status.dart';
import '../../blocs/auth/auth_bloc.dart';
import '../screens/home_screen.dart';

class AuthListener extends StatelessWidget {
  final Widget child;

  const AuthListener({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status == AuthStatus.connected) {
          Navigator.pushReplacementNamed(context, HomeScreen.routeName);
          return;
        }

        if (state.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage!)),
          );
        }
      },
      child: child,
    );
  }
}
