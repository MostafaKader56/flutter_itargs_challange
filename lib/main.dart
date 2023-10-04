import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_itargs_challange/core/repo/shared_pref_helper.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/functions/functions.dart';
import 'core/utils/app_router.dart';
import 'generated/l10n.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }

  static void setTheme(BuildContext context, bool newIsDarkMode) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setTheme(newIsDarkMode);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  bool? isDarkMode;

  @override
  void initState() {
    SharedPrefsHelper.init().then((value) {
      _locale = Functions.getLocale();
      isDarkMode = Functions.getIsDarkMode();
      setLocale(_locale ?? const Locale('en'));
      if (isDarkMode == true) {
        setTheme(true);
      }
    });
    super.initState();
  }

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  setTheme(bool newDarkMode) {
    setState(() {
      isDarkMode = newDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: (isDarkMode ?? false) ? Brightness.dark : Brightness.light,
      ),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: _locale,
    );
  }
}
