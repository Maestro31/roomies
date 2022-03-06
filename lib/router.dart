import 'package:flutter/material.dart';
import 'package:roomies/auth/ui/containers/private_route.dart';
import 'package:roomies/auth/ui/screens/login_screen.dart';
import 'package:roomies/auth/ui/screens/register_screen.dart';

import 'auth/ui/screens/home_screen.dart';

class RouteWithoutTransition<T> extends MaterialPageRoute<T> {
  RouteWithoutTransition({required WidgetBuilder builder, required RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
  }
}

Route<dynamic> router(RouteSettings settings) {
  switch (settings.name) {
    case HomeScreen.routeName:
      return RouteWithoutTransition(
        builder: (_) => const PrivateRoute(child: HomeScreen()),
        settings: settings,
      );
    case LoginScreen.routeName:
      return RouteWithoutTransition(
        builder: (_) => const LoginScreen(),
        settings: settings,
      );
    case RegisterScreen.routeName:
      return RouteWithoutTransition(
        builder: (_) => const RegisterScreen(),
        settings: settings,
      );
  }

  return RouteWithoutTransition(
    builder: (_) => const PrivateRoute(child: HomeScreen()),
    settings: settings,
  );
}
