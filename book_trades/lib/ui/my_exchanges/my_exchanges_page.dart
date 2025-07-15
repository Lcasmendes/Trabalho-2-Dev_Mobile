import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../l10n/app_localizations.dart';
import '../../viewmodels/my_exchanges_view_model.dart';
import '../components/exchange_card.dart';
import '../components/stateful_content.dart';

class MyExchangesPage extends StatefulWidget {
  const MyExchangesPage({super.key});

  @override
  State<MyExchangesPage> createState() => _MyExchangesPageState();
}

class _MyExchangesPageState extends State<MyExchangesPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<MyExchangesViewModel>(context, listen: false).fetchExchanges();
    });
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    Provider.of<MyExchangesViewModel>(context, listen: false).setSearchQuery(_searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<MyExchangesViewModel>(context);
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(localizations.myExchangesPageTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: localizations.logout,
            onPressed: () => viewModel.performLogout(context),
          ),
        ]
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: localizations.searchBarHint,
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Theme.of(context).colorScheme.surfaceContainerHigh,
              ),
            ),
          ),
          Expanded(
            child: StatefulContent(
              isLoading: viewModel.isLoading,
              errorMessage: viewModel.errorMessage,
              isEmpty: viewModel.exchanges.isEmpty,
              emptyMessage: localizations.noExchangesAvailable,
              errorMessageBuilder: (error) => localizations.errorLoadingExchanges(error),
              searchQuery: viewModel.currentSearchQuery,
              searchEmptyMessageBuilder: (query) => localizations.noExchangesFoundForQuery(query),
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: viewModel.exchanges.length,
                itemBuilder: (context, index) {
                  final exchange = viewModel.exchanges[index];
                  return ExchangeCard(exchange: exchange);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}