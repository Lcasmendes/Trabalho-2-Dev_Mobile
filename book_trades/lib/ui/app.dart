import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import '../l10n/app_localizations.dart';
import '../theme/theme.dart';
import '../theme/util.dart';
import 'login/login_page.dart';
import 'package:projeto2/ui/main/main_scaffold.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final baseTheme = MaterialTheme(GoogleFonts.robotoTextTheme());

    return MaterialApp(
      title: 'Login',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en'), Locale('pt')],
      theme: baseTheme
          .theme(MaterialTheme.lightScheme())
          .copyWith(
        textTheme: createTextTheme(context, 'Roboto', 'Merriweather'),
      ),
      darkTheme: baseTheme
          .theme(MaterialTheme.darkScheme())
          .copyWith(
        textTheme: createTextTheme(context, 'Roboto', 'Merriweather'),
      ),
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        // '/home': (context) => const MainScaffold(),
      },
    );
  }
}