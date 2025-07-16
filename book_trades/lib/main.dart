import 'package:flutter/material.dart';
import 'package:projeto2/repository/floor/login_try_dao.dart';
import 'package:projeto2/viewmodels/my_exchanges_view_model.dart';
import 'package:provider/provider.dart';
import 'package:projeto2/repository/floor/app_database.dart';
import 'package:projeto2/repository/login_try_repository.dart';
import 'package:projeto2/repository/user_repository.dart';
import 'package:projeto2/repository/exchange_repository.dart';
import 'package:projeto2/viewmodels/exchanges_view_model.dart';
import 'package:projeto2/viewmodels/login_view_model.dart';
import 'package:projeto2/viewmodels/new_exchange_view_model.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto2/ui/login/login_page.dart';
import 'package:projeto2/theme/theme.dart';
import 'package:projeto2/theme/util.dart';
import 'l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  final savedLoginDao = database.savedLoginDao;
  final savedLoginRepository = SavedLoginRepository(savedLoginDao);
  final userRepository = UserRepository();
  final exchangeRepository = ExchangeRepository();

  final baseTheme = MaterialTheme(GoogleFonts.robotoTextTheme());

  runApp(
    MaterialApp(
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
        textTheme: createTextTheme(null, 'Roboto', 'Merriweather'),
      ),
      darkTheme: baseTheme
          .theme(MaterialTheme.darkScheme())
          .copyWith(
        textTheme: createTextTheme(null, 'Roboto', 'Merriweather'),
      ),
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
      },
      builder: (BuildContext context, Widget? child) {
        final locals = AppLocalizations.of(context)!;

        return MultiProvider(
          providers: [
            Provider<UserRepository>(create: (_) => userRepository),
            Provider<SavedLoginRepository>(create: (_) => savedLoginRepository),
            Provider<ExchangeRepository>(create: (_) => exchangeRepository),
            Provider<SavedLoginDao>(create: (_) => savedLoginDao),

            ChangeNotifierProvider<MainViewModel>(
              create: (BuildContext ctx) => MainViewModel(
                ctx.read<UserRepository>(),
                ctx.read<SavedLoginRepository>(),
              ),
            ),
            ChangeNotifierProvider<ExchangesViewModel>(
              create: (BuildContext ctx) => ExchangesViewModel(
                ctx.read<ExchangeRepository>(),
                ctx.read<SavedLoginDao>(),
                ctx.read<SavedLoginRepository>(),
              ),
            ),
            ChangeNotifierProvider<NewExchangeViewModel>(
              create: (BuildContext ctx) => NewExchangeViewModel(
                ctx.read<ExchangeRepository>(),
                ctx.read<SavedLoginDao>(),
                ctx.read<SavedLoginRepository>(),
                locals, // `locals` is correctly passed here
              ),
            ),
            ChangeNotifierProvider<MyExchangesViewModel>(
              create: (BuildContext ctx) => MyExchangesViewModel(
                ctx.read<ExchangeRepository>(),
                ctx.read<SavedLoginDao>(),
                ctx.read<SavedLoginRepository>(),
              ),
            ),
          ],
          child: child,
        );
      },
    ),
  );
}