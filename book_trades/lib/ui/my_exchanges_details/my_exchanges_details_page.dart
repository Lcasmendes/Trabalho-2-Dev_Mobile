import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:projeto2/l10n/app_localizations.dart';
import 'package:projeto2/repository/exchange_data.dart';
import 'package:projeto2/repository/exchange_repository.dart';
import 'package:projeto2/repository/floor/login_try_dao.dart';

import '../../viewmodels/my_exchanges_details_view_model.dart';
import '../components/my_exchanges_card.dart';
import '../components/my_exchanges_details_card.dart';
import '../components/stateful_content.dart';

class MyExchangesDetailsPage extends StatefulWidget {
  final Exchange exchange;

  const MyExchangesDetailsPage({
    super.key,
    required this.exchange,
  });

  @override
  State<MyExchangesDetailsPage> createState() => _MyExchangesDetailsPageState();
}

class _MyExchangesDetailsPageState extends State<MyExchangesDetailsPage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<MyExchangesDetailsViewModel>(context, listen: false).fetchExchanges();
    });
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final viewModel = Provider.of<MyExchangesDetailsViewModel>(context);

          return Scaffold(
            appBar: AppBar(
              backgroundColor: colorScheme.inversePrimary,
              title: Text(
                localizations.exchangeDetailsTitle,
                style: TextStyle(color: colorScheme.onSurface),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    viewModel.chosenExchange.bookName,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: colorScheme.onSurface),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${localizations.exchangeState}: ${viewModel.chosenExchange.bookState}',
                    style: TextStyle(color: colorScheme.onSurface),
                  ),
                  Text(
                    '${localizations.exchangeSearchingFor}: ${viewModel.chosenExchange.searchingFor}',
                    style: TextStyle(color: colorScheme.onSurface),
                  ),
                  Text(
                    '${localizations.exchangeSuggestions}: ${viewModel.chosenExchange.sugested}',
                    style: TextStyle(color: colorScheme.onSurface),
                  ),
                  const SizedBox(height: 24),

                  Text(
                    localizations.offersTitle,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(color: colorScheme.onSurface),
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    itemCount: viewModel.offerings.length,
                    itemBuilder: (context, index) {
                      final offering = viewModel.offerings[index];
                      return MyExchangesDetailsCard(offering: offering);
                    },
                   ),
                  ),
                ],
              ),
            ),
          );
  }
}