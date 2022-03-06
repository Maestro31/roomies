import 'package:flutter/material.dart';

class PageLayout extends StatelessWidget {
  final Widget child;

  const PageLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: child,
        ),
      ),
    );
  }
}
