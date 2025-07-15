import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import 'package:projeto2/repository/exchange_data.dart';
import '../exchange_details/exchange_details_page.dart';

class ExchangeCard extends StatelessWidget {
  final Exchange exchange;

  const ExchangeCard({
    super.key,
    required this.exchange,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      color: colorScheme.surfaceVariant, // Usar uma cor do tema para o card
      child: InkWell( // Torna o card clicável
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ExchangeDetailsPage(exchange: exchange),
            ),
          );
        },
        borderRadius: BorderRadius.circular(12), // Para combinar com o Card
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                exchange.bookName,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(color: colorScheme.onSurfaceVariant), // Usar onSurfaceVariant para texto no Card
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
              // Você pode adicionar um botão ou mais informações aqui se quiser
            ],
          ),
        ),
      ),
    );
  }
}