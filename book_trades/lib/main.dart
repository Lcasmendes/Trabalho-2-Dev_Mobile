import 'package:flutter/material.dart';
import 'package:projeto2/repository/floor/login_try_dao.dart';
import 'package:projeto2/viewmodels/my_exchanges_view_model.dart';
import 'package:provider/provider.dart';
import 'package:projeto2/ui/app.dart';
import 'package:projeto2/repository/floor/app_database.dart';
import 'package:projeto2/repository/login_try_repository.dart';
import 'package:projeto2/repository/user_repository.dart';
import 'package:projeto2/repository/exchange_repository.dart';
import 'package:projeto2/viewmodels/exchanges_view_model.dart';
import 'package:projeto2/viewmodels/login_view_model.dart';
import 'package:projeto2/viewmodels/new_exchange_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  final savedLoginDao = database.savedLoginDao;
  final savedLoginRepository = SavedLoginRepository(savedLoginDao);
  final userRepository = UserRepository();
  final exchangeRepository = ExchangeRepository();

  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => userRepository),
        Provider(create: (_) => savedLoginRepository),
        Provider(create: (_) => exchangeRepository),
        Provider(create: (_) => savedLoginDao),

        ChangeNotifierProvider(
          create: (context) => MainViewModel(
            context.read<UserRepository>(),
            context.read<SavedLoginRepository>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => ExchangesViewModel(
            context.read<ExchangeRepository>(),
            context.read<SavedLoginDao>(),
            context.read<SavedLoginRepository>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => NewExchangeViewModel(
            context.read<ExchangeRepository>(),
            context.read<SavedLoginDao>(),
            context.read<SavedLoginRepository>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => MyExchangesViewModel(
            context.read<ExchangeRepository>(),
            context.read<SavedLoginDao>(),
            context.read<SavedLoginRepository>(),
          ),
        ),
      ],
      child: const App(),
    ),
  );
}
