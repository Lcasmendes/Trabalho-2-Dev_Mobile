import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/exchanges_view_model.dart';

class MyExchangesPage extends StatelessWidget {
  const MyExchangesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ExchangesViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Trocas Disponíveis'),
      ),
      body:
      viewModel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: viewModel.exchanges.length,
        itemBuilder: (context, index) {
          final exchange = viewModel.exchanges[index];
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
                  Text('Estado: ${exchange.bookState}'),
                  Text('Buscando por: ${exchange.searchingFor}'),
                  Text('Sugestões: ${exchange.sugested}'),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
