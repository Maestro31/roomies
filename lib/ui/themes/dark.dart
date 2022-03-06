import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomColors {
  static get gray1 => const Color(0xFF2B3242);
  static get gray2 => const Color(0xFF5D709C);
  static get gray3 => const Color(0xFF8598B4);
  static get gray4 => const Color(0xFFA1ADCB);
  static get gray5 => const Color(0xFFCCD6ED);
  static get gray6 => const Color(0xFFF5F5F5);
}

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      fontFamily: GoogleFonts.roboto().fontFamily,
      scaffoldBackgroundColor: CustomColors.gray1,
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 18.0,
              foreground: Paint()..color = CustomColors.gray4,
            ),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(const Size.fromHeight(48)),
          backgroundColor: MaterialStateProperty.all(CustomColors.gray2),
          textStyle: MaterialStateProperty.all(
            TextStyle(
              fontSize: 18.0,
              foreground: Paint()..color = CustomColors.gray6,
            ),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(color: CustomColors.gray3),
          border: const OutlineInputBorder(borderSide: BorderSide.none),
          errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          fillColor: CustomColors.gray5,
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          errorStyle: const TextStyle(height: 0, color: Colors.transparent)),
    );
  }
}
