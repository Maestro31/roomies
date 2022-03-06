import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/auth/models/auth_status.dart';
import '../../../ui/navigation_helpers/redirect_to.dart';
import '../../blocs/auth/auth_bloc.dart';
import '../screens/login_screen.dart';

class PrivateRoute extends StatelessWidget {
  final Widget child;

  const PrivateRoute({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AuthBloc, AuthState, AuthStatus>(
        selector: (state) => state.status,
        builder: (context, status) {
          switch (status) {
            case AuthStatus.connected:
              return child;
            case AuthStatus.idle:
            case AuthStatus.disconnected:
              redirectTo(context, LoginScreen.routeName);
              break;
            case AuthStatus.pending:
              return const Center(child: CircularProgressIndicator());
          }

          return Container();
        });
  }
}
