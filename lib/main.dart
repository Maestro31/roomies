import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:roomies/auth/bloc/auth_bloc.dart';
import 'package:roomies/dependencies.dart';
import 'package:roomies/router.dart';
import 'package:roomies/auth/ui/screens/home_screen.dart';
import 'package:roomies/ui/themes/dark.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(Dependencies.authGateway),
      child: MaterialApp(
        theme: AppTheme.darkTheme,
        title: 'Roomies',
        initialRoute: HomeScreen.routeName,
        onGenerateRoute: router,
        localizationsDelegates: [
          FlutterI18nDelegate(
            translationLoader: FileTranslationLoader(
              fallbackFile: 'fr',
              basePath: 'assets/locales',
              useCountryCode: false,
              forcedLocale: const Locale('fr', ''),
            ),
            missingTranslationHandler: (key, locale) {
              // ignore: avoid_print
              print("--- Missing Key: $key, languageCode: ${locale!.languageCode}");
            },
          ),
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        builder: FlutterI18n.rootAppBuilder(),
      ),
    );
  }
}
