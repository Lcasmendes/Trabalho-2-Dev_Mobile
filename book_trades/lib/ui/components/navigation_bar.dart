import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import '../main/main_page.dart';
import '../my_exchanges/my_exchanges_page.dart';
import '../new_exchanges/new_exchange_page.dart';

class CustomNavBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!; // Acesso aos textos
    final colorScheme = Theme.of(context).colorScheme; // Acesso ao ColorScheme do tema

    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: localizations.navBarHome,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.swap_horiz),
          label: localizations.navBarMyExchanges,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.add_box),
          label: localizations.navBarNewExchange,
        ),
      ],
      currentIndex: widget.selectedIndex,
      selectedItemColor: colorScheme.primary,
      unselectedItemColor: colorScheme.onSurfaceVariant,
      backgroundColor: colorScheme.surfaceContainerHigh,
      onTap: widget.onItemTapped,
      type: BottomNavigationBarType.fixed,
    );
  }
}

class AppNavigator {
  static void navigateToPage(BuildContext context, int index) {
    // A lógica de navegação permanece a mesma, pois as páginas em si não dependem diretamente
    // do texto da navbar para a navegação, apenas os rótulos visuais.
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainPage()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MyExchangesPage()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const NewExchangePage()),
        );
        break;
    }
  }
}