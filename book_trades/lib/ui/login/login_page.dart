import 'package:flutter/material.dart';
import 'package:projeto2/l10n/app_localizations.dart';
import 'package:projeto2/ui/loading_dialog.dart';
import 'package:projeto2/ui/login/form_error.dart';
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

  String? _getErrorMessage(FormError error, String? custom) {
    final localizations = AppLocalizations.of(context)!;
    switch (error) {
      case FormError.emptyField:
        return localizations.empty;
      case FormError.wrongUsername:
        return localizations.wrong_username;
      case FormError.wrongPassword:
        return localizations.wrong_password;
      case FormError.custom:
        return custom ?? "";
      case FormError.none:
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
        padding: const EdgeInsets.all(24.0),
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
                          // style: TextStyle(color: colorScheme.onSurface), // Remove this, theme handles it
                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(context)!.username,
                            // labelStyle: TextStyle(color: colorScheme.onSurfaceVariant), // Remove this, theme handles it
                            border: const OutlineInputBorder(),
                            prefixIcon: const Icon( // Keep the icon, but remove explicit color
                              Icons.person,
                              // color: colorScheme.onSurfaceVariant, // Remove this, theme handles it
                            ),
                            errorText: _getErrorMessage(
                              viewModel.usernameError,
                              viewModel.customError,
                            ),
                            // Remove explicit border styles, theme handles them
                            // enabledBorder: OutlineInputBorder(
                            //   borderSide: BorderSide(color: colorScheme.outline),
                            // ),
                            // focusedBorder: OutlineInputBorder(
                            //   borderSide: BorderSide(color: colorScheme.primary, width: 2.0),
                            // ),
                            // errorBorder: OutlineInputBorder(
                            //   borderSide: BorderSide(color: colorScheme.error),
                            // ),
                            // focusedErrorBorder: OutlineInputBorder(
                            //   borderSide: BorderSide(color: colorScheme.error, width: 2.0),
                            // ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: viewModel.passwordController,
                          obscureText: true,
                          // style: TextStyle(color: colorScheme.onSurface), // Remove this, theme handles it
                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(context)!.password,
                            // labelStyle: TextStyle(color: colorScheme.onSurfaceVariant), // Remove this, theme handles it
                            border: const OutlineInputBorder(),
                            prefixIcon: const Icon( // Keep the icon, but remove explicit color
                              Icons.lock,
                              // color: colorScheme.onSurfaceVariant, // Remove this, theme handles it
                            ),
                            errorText: _getErrorMessage(
                              viewModel.passwordError,
                              viewModel.customError,
                            ),
                            // Remove explicit border styles, theme handles them
                            // enabledBorder: OutlineInputBorder(
                            //   borderSide: BorderSide(color: colorScheme.outline),
                            // ),
                            // focusedBorder: OutlineInputBorder(
                            //   borderSide: BorderSide(color: colorScheme.primary, width: 2.0),
                            // ),
                            // errorBorder: OutlineInputBorder(
                            //   borderSide: BorderSide(color: colorScheme.error),
                            // ),
                            // focusedErrorBorder: OutlineInputBorder(
                            //   borderSide: BorderSide(color: colorScheme.error, width: 2.0),
                            // ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
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
                            const SizedBox(width: 20),
                            FilledButton(
                              onPressed: () => viewModel.clearLogin(),
                              style: FilledButton.styleFrom(
                                backgroundColor: colorScheme.secondary,
                                foregroundColor: colorScheme.onSecondary,
                              ),
                              child: Text(AppLocalizations.of(context)!.clear),
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