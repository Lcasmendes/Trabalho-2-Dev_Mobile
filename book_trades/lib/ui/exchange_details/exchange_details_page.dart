import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:projeto2/l10n/app_localizations.dart';
import 'package:projeto2/repository/exchange_data.dart';
import 'package:projeto2/viewmodels/exchange_details_view_model.dart';
import 'package:projeto2/repository/exchange_repository.dart';
import 'package:projeto2/repository/floor/login_try_dao.dart';

class ExchangeDetailsPage extends StatefulWidget {
  final Exchange exchange;

  const ExchangeDetailsPage({
    super.key,
    required this.exchange,
  });

  @override
  State<ExchangeDetailsPage> createState() => _ExchangeDetailsPageState();
}

class _ExchangeDetailsPageState extends State<ExchangeDetailsPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return ChangeNotifierProvider(
      create: (context) => ExchangeDetailsViewModel(
        Provider.of<ExchangeRepository>(context, listen: false),
        Provider.of<SavedLoginDao>(context, listen: false),
        widget.exchange,
      ),
      child: Consumer<ExchangeDetailsViewModel>(
        builder: (context, viewModel, child) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (viewModel.successMessage != null) {
              Fluttertoast.showToast(
                msg: localizations.offerMadeSuccessfully,
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
              String displayMessage;
              switch (viewModel.errorMessage) {
                case "userNotLoggedIn":
                  displayMessage = localizations.userNotLoggedInError;
                  break;
                case "offeringBookNameRequired":
                  displayMessage = localizations.validationRequiredField;
                  break;
                case "offeringBookStateRequired":
                  displayMessage = localizations.validationSelectState;
                  break;
                case "failedToMakeOffer":
                  displayMessage = localizations.failedToMakeOffer;
                  break;
                default:
                  displayMessage = localizations.unknownError;
              }
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
              backgroundColor: colorScheme.inversePrimary,
              title: Text(
                localizations.exchangeDetailsTitle,
                style: TextStyle(color: colorScheme.onSurface),
              ),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    viewModel.exchange.bookName,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: colorScheme.onSurface),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${localizations.exchangeState}: ${viewModel.exchange.bookState}',
                    style: TextStyle(color: colorScheme.onSurface),
                  ),
                  Text(
                    '${localizations.exchangeSearchingFor}: ${viewModel.exchange.searchingFor}',
                    style: TextStyle(color: colorScheme.onSurface),
                  ),
                  Text(
                    '${localizations.exchangeSuggestions}: ${viewModel.exchange.sugested}',
                    style: TextStyle(color: colorScheme.onSurface),
                  ),
                  const SizedBox(height: 24),
                  Divider(color: colorScheme.outlineVariant),
                  const SizedBox(height: 24),

                  Text(
                    localizations.makeOfferTitle,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(color: colorScheme.onSurface),
                  ),
                  const SizedBox(height: 16),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: viewModel.offeringBookNameController,
                          style: TextStyle(color: colorScheme.onSurface),
                          decoration: InputDecoration(
                            labelText: localizations.offeringBookNameHint,
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
                            if (value == null || value.trim().isEmpty) { // Usar trim() aqui também
                              return localizations.validationRequiredField;
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 24),
                        Text(
                          localizations.offeringBookStateTitle,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(color: colorScheme.onSurface),
                        ),
                        RadioListTile<String>(
                          title: Text(localizations.stateNew, style: TextStyle(color: colorScheme.onSurface)),
                          value: 'Novo',
                          groupValue: viewModel.selectedOfferingBookState,
                          onChanged: viewModel.setSelectedOfferingBookState,
                          activeColor: colorScheme.primary,
                        ),
                        RadioListTile<String>(
                          title: Text(localizations.stateSemiNew, style: TextStyle(color: colorScheme.onSurface)),
                          value: 'Seminovo',
                          groupValue: viewModel.selectedOfferingBookState,
                          onChanged: viewModel.setSelectedOfferingBookState,
                          activeColor: colorScheme.primary,
                        ),
                        RadioListTile<String>(
                          title: Text(localizations.statePreserved, style: TextStyle(color: colorScheme.onSurface)),
                          value: 'Conservado',
                          groupValue: viewModel.selectedOfferingBookState,
                          onChanged: viewModel.setSelectedOfferingBookState,
                          activeColor: colorScheme.primary,
                        ),
                        RadioListTile<String>(
                          title: Text(localizations.stateDamaged, style: TextStyle(color: colorScheme.onSurface)),
                          value: 'Danificado',
                          groupValue: viewModel.selectedOfferingBookState,
                          onChanged: viewModel.setSelectedOfferingBookState,
                          activeColor: colorScheme.primary,
                        ),
                        const SizedBox(height: 32),
                        Center(
                          child: ElevatedButton(
                            onPressed: viewModel.isLoading
                                ? null
                                : () async {
                              if (_formKey.currentState!.validate()) {
                                if (viewModel.selectedOfferingBookState == null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(localizations.validationSelectState)),
                                  );
                                  return;
                                }
                                await viewModel.makeOffer();
                                // Após a tentativa de fazer a oferta, o estado do ViewModel será atualizado
                                // e o Consumer acima reagirá aos errorMessage/successMessage.
                                // Não é necessário mais lógica de toast aqui diretamente.
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: colorScheme.primary,
                              foregroundColor: colorScheme.onPrimary,
                              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: viewModel.isLoading
                                ? const CircularProgressIndicator(color: Colors.white)
                                : Text(localizations.makeOfferButton),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  if (viewModel.exchange.offerings.isNotEmpty) ...[
                    Divider(color: colorScheme.outlineVariant),
                    const SizedBox(height: 24),
                    Text(
                      localizations.currentOffersTitle,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(color: colorScheme.onSurface),
                    ),
                    const SizedBox(height: 16),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: viewModel.exchange.offerings.length,
                      itemBuilder: (context, index) {
                        final offering = viewModel.exchange.offerings[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 8),
                          color: colorScheme.surfaceContainerLow,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${localizations.offeredBook}: ${offering.book}',
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(color: colorScheme.onSurface),
                                ),
                                Text(
                                  '${localizations.offeredBookState}: ${offering.bookState}',
                                  style: TextStyle(color: colorScheme.onSurfaceVariant),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}