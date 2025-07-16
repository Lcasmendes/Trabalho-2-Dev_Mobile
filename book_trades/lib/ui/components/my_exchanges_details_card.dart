import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../l10n/app_localizations.dart';
import 'package:projeto2/repository/exchange_data.dart';
import '../../repository/exchange_repository.dart';
import '../../repository/floor/login_try_dao.dart';
import '../../repository/offering_data.dart';
import '../../viewmodels/my_exchanges_details_view_model.dart';
import '../exchange_details/exchange_details_page.dart';
import '../my_exchanges_details/my_exchanges_details_page.dart';

class MyExchangesDetailsCard extends StatelessWidget {
  final Offering offering;

  const MyExchangesDetailsCard({
    super.key,
    required this.offering,
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
            // todo
          },
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  offering.book,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(color: colorScheme.onSurfaceVariant),
                ),
                const SizedBox(height: 8),
                Text(
                  '${localizations.exchangeState}: ${offering.bookState}',
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