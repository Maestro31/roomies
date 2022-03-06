import 'dart:async';

import 'package:flutter/material.dart';

void redirectTo(context, String routeName, {Object? arguments}) {
  void run() {
    scheduleMicrotask(() {
      Navigator.pushReplacementNamed(context, routeName, arguments: arguments);
    });
  }

  run();
}
