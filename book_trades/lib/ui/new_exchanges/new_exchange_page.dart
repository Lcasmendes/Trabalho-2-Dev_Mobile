import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../l10n/app_localizations.dart';
import '../../viewmodels/new_exchange_view_model.dart';

class NewExchangePage extends StatefulWidget {
  const NewExchangePage({super.key});

  @override
  State<NewExchangePage> createState() => _NewExchangePageState();
}

class _NewExchangePageState extends State<NewExchangePage> {
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<NewExchangeViewModel>(context);
    final localizations = AppLocalizations.of(context)!;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (viewModel.successMessage != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(localizations.exchangeRegisteredSuccess)),
        );
        viewModel.clearSuccessMessage();
      }
      if (viewModel.errorMessage != null) {
        String messageKey = viewModel.errorMessage!;
        String? displayMessage;

        if (messageKey == "validationRequiredField") {
          displayMessage = localizations.validationRequiredField;
        } else if (messageKey == "validationSelectState") {
          displayMessage = localizations.validationSelectState;
        } else if (messageKey == "suggestionsRequired") {
          displayMessage = localizations.validationRequiredField;
        } else if (messageKey == "genresOrSuggestionsRequired") {
          displayMessage = localizations.genresOrSuggestionsRequired;
        }
        else {
          displayMessage = localizations.exchangeRegisteredError(messageKey);
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(displayMessage)),
        );
        viewModel.clearErrorMessage();
      }
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(localizations.newExchangePageTitle),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: viewModel.bookNameController,
                decoration: InputDecoration(
                  labelText: localizations.bookNameHint,
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return localizations.validationRequiredField;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              Text(
                localizations.bookStateTitle,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              RadioListTile<String>(
                title: Text(localizations.stateNew),
                value: 'Novo',
                groupValue: viewModel.selectedBookState,
                onChanged: viewModel.setSelectedBookState,
              ),
              RadioListTile<String>(
                title: Text(localizations.stateSemiNew),
                value: 'Seminovo',
                groupValue: viewModel.selectedBookState,
                onChanged: viewModel.setSelectedBookState,
              ),
              RadioListTile<String>(
                title: Text(localizations.statePreserved),
                value: 'Conservado',
                groupValue: viewModel.selectedBookState,
                onChanged: viewModel.setSelectedBookState,
              ),
              RadioListTile<String>(
                title: Text(localizations.stateDamaged),
                value: 'Danificado',
                groupValue: viewModel.selectedBookState,
                onChanged: viewModel.setSelectedBookState,
              ),
              Builder(
                builder: (context) {
                  if (viewModel.selectedBookState == null && _formKey.currentState?.validate() == true) {
                  }
                  return const SizedBox.shrink();
                },
              ),
              const SizedBox(height: 24),

              Text(
                localizations.genresTitle,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              CheckboxListTile(
                title: Text(localizations.onlySuggestions),
                value: viewModel.onlySuggestionsSelected,
                onChanged: viewModel.setOnlySuggestionsSelected,
              ),
              if (!viewModel.onlySuggestionsSelected)
                ...viewModel.availableGenres.map((genre) {
                  return CheckboxListTile(
                    title: Text(_getGenreLocalizedText(localizations, genre)),
                    value: viewModel.selectedGenres.contains(genre),
                    onChanged: (bool? isSelected) {
                      viewModel.toggleGenre(genre, isSelected);
                    },
                  );
                }),
              const SizedBox(height: 24),

              TextFormField(
                controller: viewModel.suggestionsController,
                decoration: InputDecoration(
                  labelText: localizations.suggestionsHint,
                  border: const OutlineInputBorder(),
                ),
                enabled: viewModel.onlySuggestionsSelected,
                validator: (value) {
                  if (viewModel.onlySuggestionsSelected && (value == null || value.isEmpty)) {
                    return localizations.validationRequiredField;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),

              Center(
                child: ElevatedButton(
                  onPressed: viewModel.isLoading
                      ? null
                      : () async {
                    if (_formKey.currentState!.validate()) {
                      if (viewModel.selectedBookState == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(localizations.validationSelectState)),
                        );
                        return;
                      }
                      await viewModel.registerExchange();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Theme.of(context).colorScheme.onPrimary,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: viewModel.isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : Text(localizations.registerButton),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getGenreLocalizedText(AppLocalizations localizations, String genre) {
    switch (genre) {
      case 'Fantasia': return localizations.genreFantasy;
      case 'Ficção científica': return localizations.genreSciFi;
      case 'Mistério': return localizations.genreMystery;
      case 'Romance': return localizations.genreRomance;
      case 'Terror': return localizations.genreHorror;
      case 'Não ficção': return localizations.genreNonFiction;
      default: return genre;
    }
  }
}