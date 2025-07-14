import 'package:flutter/material.dart';
import 'package:projeto2/repository/floor/app_database.dart';
import 'package:projeto2/repository/login_try_repository.dart';
import 'package:projeto2/ui/app.dart';
import 'package:projeto2/viewmodels/login_tries_view_model.dart';
import 'package:projeto2/viewmodels/login_view_model.dart';
import 'package:projeto2/repository/user_repository.dart';
import 'package:projeto2/repository/exchange_repository.dart';
import 'package:projeto2/viewmodels/exchanges_view_model.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  final savedLoginRepository = SavedLoginRepository(database.savedLoginDao);
  final userRepository = UserRepository();
  final exchangeRepository = ExchangeRepository();

  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => userRepository),
        Provider(create: (_) => savedLoginRepository),
        Provider(create: (_) => exchangeRepository),

        ChangeNotifierProvider(
          create:
              (context) => MainViewModel(
                context.read<UserRepository>(),
                context.read<SavedLoginRepository>(),
              ),
        ),
        ChangeNotifierProvider(
          create:
              (context) =>
                  LoginTriesViewModel(context.read<SavedLoginRepository>()),
        ),
        ChangeNotifierProvider(
          create:
              (context) =>
                  ExchangesViewModel(context.read<ExchangeRepository>()),
        ),
      ],
      child: const App(),
    ),
  );
}
