import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (viewModel.successMessage != null) {
        String displayMessage = _getSuccessLocalizedText(localizations, viewModel.successMessage!);

        Fluttertoast.showToast(
          msg: displayMessage,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: colorScheme.secondary,
          textColor: colorScheme.onSecondary,
          fontSize: 16.0,
          timeInSecForIosWeb: 2,
        );
        viewModel.clearSuccessMessage();
      }
      if (viewModel.errorMessage != null) {
        String displayMessage = _getErrorLocalizedText(localizations, viewModel.errorMessage!);

        Fluttertoast.showToast(
          msg: displayMessage,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: colorScheme.error,
          textColor: colorScheme.onError,
          fontSize: 16.0,
          timeInSecForIosWeb: 2,
        );
        viewModel.clearErrorMessage();
      }
    });

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(localizations.newExchangePageTitle),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              tooltip: localizations.logout,
              onPressed: () => viewModel.performLogout(context),
            ),
          ]
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
                style: TextStyle(color: colorScheme.onSurface),
                decoration: InputDecoration(
                  labelText: localizations.bookNameHint,
                  labelStyle: TextStyle(color: colorScheme.onSurfaceVariant),
                  border: const OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: colorScheme.outline),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: colorScheme.primary, width: 2.0),
                  ),
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
                style: textTheme.titleMedium?.copyWith(color: colorScheme.onSurface),
              ),
              RadioListTile<String>(
                title: Text(localizations.stateNew, style: TextStyle(color: colorScheme.onSurface)),
                value: 'Novo',
                groupValue: viewModel.selectedBookState,
                onChanged: viewModel.setSelectedBookState,
                activeColor: colorScheme.primary,
              ),
              RadioListTile<String>(
                title: Text(localizations.stateSemiNew, style: TextStyle(color: colorScheme.onSurface)),
                value: 'Seminovo',
                groupValue: viewModel.selectedBookState,
                onChanged: viewModel.setSelectedBookState,
                activeColor: colorScheme.primary,
              ),
              RadioListTile<String>(
                title: Text(localizations.statePreserved, style: TextStyle(color: colorScheme.onSurface)),
                value: 'Conservado',
                groupValue: viewModel.selectedBookState,
                onChanged: viewModel.setSelectedBookState,
                activeColor: colorScheme.primary,
              ),
              RadioListTile<String>(
                title: Text(localizations.stateDamaged, style: TextStyle(color: colorScheme.onSurface)),
                value: 'Danificado',
                groupValue: viewModel.selectedBookState,
                onChanged: viewModel.setSelectedBookState,
                activeColor: colorScheme.primary,
              ),
              const SizedBox(height: 24),

              Text(
                localizations.genresTitle,
                style: textTheme.titleMedium?.copyWith(color: colorScheme.onSurface),
              ),
              CheckboxListTile(
                title: Text(localizations.onlySuggestions, style: TextStyle(color: colorScheme.onSurface)),
                value: viewModel.onlySuggestionsSelected,
                onChanged: viewModel.setOnlySuggestionsSelected,
                activeColor: colorScheme.primary,
                checkColor: colorScheme.onPrimary,
              ),
              if (!viewModel.onlySuggestionsSelected)
                ...viewModel.availableGenres.map((genre) {
                  return CheckboxListTile(
                    title: Text(_getGenreLocalizedText(localizations, genre), style: TextStyle(color: colorScheme.onSurface)),
                    value: viewModel.selectedGenres.contains(genre),
                    onChanged: (bool? isSelected) {
                      viewModel.toggleGenre(genre, isSelected);
                    },
                    activeColor: colorScheme.primary,
                    checkColor: colorScheme.onPrimary,
                  );
                }),
              const SizedBox(height: 24),

              TextFormField(
                controller: viewModel.suggestionsController,
                style: TextStyle(color: colorScheme.onSurface),
                decoration: InputDecoration(
                  labelText: localizations.suggestionsHint,
                  labelStyle: TextStyle(color: colorScheme.onSurfaceVariant),
                  border: const OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: colorScheme.outline),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: colorScheme.primary, width: 2.0),
                  ),
                ),
                enabled: true,
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
                      await viewModel.registerExchange(localizations);
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

  String _getSuccessLocalizedText(AppLocalizations localizations, String key) {
    switch (key) {
      case 'exchangeRegisteredSuccess': return localizations.exchangeRegisteredSuccess;
      default: return localizations.unknownSuccess;
    }
  }

  String _getErrorLocalizedText(AppLocalizations localizations, String key) {
    switch (key) {
      case 'userIdNotFound': return localizations.userIdNotFound;
      case 'bookNameRequired': return localizations.validationRequiredField;
      case 'bookStateRequired': return localizations.validationSelectState;
      case 'suggestionsRequired': return localizations.validationRequiredField;
      case 'genresOrSuggestionsRequired': return localizations.genresOrSuggestionsRequired;
      case 'exchangeRegisteredError': return localizations.exchangeRegisteredError;
      default: return localizations.unknownError;
    }
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