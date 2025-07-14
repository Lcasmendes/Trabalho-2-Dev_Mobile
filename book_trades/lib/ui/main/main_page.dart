import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../l10n/app_localizations.dart';
import '../../viewmodels/exchanges_view_model.dart';
import '../components/navigation_bar.dart';

class MainPage extends StatefulWidget { // Alterado para StatefulWidget
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    AppNavigator.navigateToPage(context, index);
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ExchangesViewModel>(context);
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(localizations.mainPageTitle),
      ),
      body: viewModel.isLoading
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
                  // Você pode internacionalizar esses textos também, se quiser
                  Text('Estado: ${exchange.bookState}'),
                  Text('Buscando por: ${exchange.searchingFor}'),
                  Text('Sugestões: ${exchange.sugested}'),
                  const SizedBox(height: 8),
                  Text(
                    'Ofertas (${exchange.offerings.length}):',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  ...exchange.offerings.map(
                        (offering) => Text(
                      '- ${offering.book} (${offering.bookState})',
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: CustomNavBar( // Adicionando a sua CustomNavBar aqui
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}