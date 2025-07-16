import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../l10n/app_localizations.dart';
import 'package:projeto2/repository/exchange_data.dart';
import '../../repository/exchange_repository.dart';
import '../../repository/floor/login_try_dao.dart';
import '../../viewmodels/my_exchanges_details_view_model.dart';
import '../exchange_details/exchange_details_page.dart';
import '../my_exchanges_details/my_exchanges_details_page.dart';

class MyExchangesCard extends StatelessWidget {
  final Exchange exchange;

  const MyExchangesCard({
    super.key,
    required this.exchange,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      color: colorScheme.surfaceVariant,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChangeNotifierProvider(
                create: (context) => MyExchangesDetailsViewModel(
                  context.read<ExchangeRepository>(),
                  context.read<SavedLoginDao>(),
                  exchange,
                ),
                child: MyExchangesDetailsPage(exchange: exchange),
              ),
            ),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                exchange.bookName,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(color: colorScheme.onSurfaceVariant),
              ),
              const SizedBox(height: 8),
              Text(
                '${localizations.exchangeState}: ${exchange.bookState}',
                style: TextStyle(color: colorScheme.onSurfaceVariant),
              ),
              Text(
                '${localizations.exchangeSearchingFor}: ${exchange.searchingFor}',
                style: TextStyle(color: colorScheme.onSurfaceVariant),
              ),
              Text(
                '${localizations.exchangeSuggestions}: ${exchange.sugested}',
                style: TextStyle(color: colorScheme.onSurfaceVariant),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}