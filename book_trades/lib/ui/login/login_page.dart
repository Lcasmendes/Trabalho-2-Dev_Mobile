import 'package:flutter/material.dart';
import 'package:projeto2/l10n/app_localizations.dart';
import 'package:projeto2/ui/loading_dialog.dart';
import 'package:projeto2/viewmodels/login_view_model.dart';
import 'package:provider/provider.dart';

import '../../utils/navigation_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    final viewModel = Provider.of<MainViewModel>(context, listen: false);

    Future.microtask(() => viewModel.checkSavedLogin(context));

    viewModel.addListener(() {
      if (viewModel.isLoading) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => const LoadingDialog(),
        );
      } else {
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        }
      }
    });
  }

  void onLoginSuccess() {
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (_) => CustomNavBar()));
  }

  String? _getErrorMessage(String error) {
    final localizations = AppLocalizations.of(context)!;
    switch (error) {
      case "empty":
        return localizations.empty;
      case "wrong_email_or_pass":
        return localizations.wrong_email_or_pass;
      case "error":
        return localizations.error;
      case "":
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<MainViewModel>(context);
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          AppLocalizations.of(context)!.login_page,
          style: TextStyle(color: colorScheme.onSurface),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: viewModel.usernameController,
                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(context)!.email,
                            border: const OutlineInputBorder(),
                            prefixIcon: const Icon(
                              Icons.person,
                            ),
                            errorText: _getErrorMessage(
                              viewModel.usernameError,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: viewModel.passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(context)!.password,
                            border: const OutlineInputBorder(),
                            prefixIcon: const Icon(
                              Icons.lock,
                            ),
                            errorText: _getErrorMessage(
                              viewModel.passwordError,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const SizedBox(height: 20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FilledButton(
                              onPressed: () => viewModel.performLogin(onLoginSuccess),
                              style: FilledButton.styleFrom(
                                backgroundColor: colorScheme.primary,
                                foregroundColor: colorScheme.onPrimary,
                              ),
                              child: Text(AppLocalizations.of(context)!.login),
                            ),
                            const SizedBox(height: 20),
                            FilledButton(
                              onPressed: () => viewModel.createAccount(),
                              style: FilledButton.styleFrom(
                                backgroundColor: colorScheme.secondary,
                                foregroundColor: colorScheme.onSecondary,
                              ),
                              child: Text(AppLocalizations.of(context)!.create_account_label),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}