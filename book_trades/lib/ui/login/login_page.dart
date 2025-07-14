import 'package:flutter/material.dart';
import 'package:projeto2/l10n/app_localizations.dart';
import 'package:projeto2/ui/loading_dialog.dart';
import 'package:projeto2/ui/login/form_error.dart';
import 'package:projeto2/ui/main/main_page.dart';
import 'package:projeto2/ui/tries/login_tries_page.dart';
import 'package:projeto2/viewmodels/login_view_model.dart';
import 'package:provider/provider.dart';

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

    // Verifica se já existe login salvo e pula login se tiver
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
    ).pushReplacement(MaterialPageRoute(builder: (_) => const MainPage()));
  }

  void onClickInLoginTries() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => const LoginTriesPage()));
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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(AppLocalizations.of(context)!.login_page),
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
                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(context)!.username,
                            border: const OutlineInputBorder(),
                            prefixIcon: const Icon(Icons.person),
                            errorText: _getErrorMessage(
                              viewModel.usernameError,
                              viewModel.customError,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: viewModel.passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(context)!.password,
                            border: const OutlineInputBorder(),
                            prefixIcon: const Icon(Icons.lock),
                            errorText: _getErrorMessage(
                              viewModel.passwordError,
                              viewModel.customError,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FilledButton(
                              onPressed:
                                  () => viewModel.performLogin(onLoginSuccess),
                              child: Text(AppLocalizations.of(context)!.login),
                            ),
                            const SizedBox(width: 20),
                            FilledButton(
                              onPressed: () => viewModel.clearLogin(),
                              child: Text(AppLocalizations.of(context)!.clear),
                            ),
                          ],
                        ),
                        const SizedBox(height: 50),
                        FilledButton(
                          onPressed: onClickInLoginTries,
                          child: Text(
                            AppLocalizations.of(
                              context,
                            )!.view_log_of_login_tries,
                          ),
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
