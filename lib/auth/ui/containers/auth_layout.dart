import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'auth_listener.dart';
import '../../../ui/containers/page_layout.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;

  const AuthLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthListener(
      child: PageLayout(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 50),
              child: Text(
                'Roomies',
                style: TextStyle(
                  fontFamily: GoogleFonts.vampiroOne().fontFamily,
                  fontSize: 64,
                  color: const Color(0xFFC4DB79),
                ),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
