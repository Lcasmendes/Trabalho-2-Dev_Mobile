import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import 'package:projeto2/repository/exchange_data.dart';

class ExchangeCard extends StatelessWidget {
  final Exchange exchange;

  const ExchangeCard({
    super.key,
    required this.exchange,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              exchange.bookName,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text('${localizations.exchangeState}: ${exchange.bookState}'),
            Text('${localizations.exchangeSearchingFor}: ${exchange.searchingFor}'),
            Text('${localizations.exchangeSuggestions}: ${exchange.sugested}'),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}