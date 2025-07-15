import 'package:flutter/material.dart';
import 'package:projeto2/ui/my_exchanges/my_exchanges_page.dart';
import '../l10n/app_localizations.dart';
import '../ui/main/main_page.dart';
import '../ui/new_exchanges/new_exchange_page.dart';

class CustomNavBar extends StatefulWidget {
  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = [
    MainPage(),
    MyExchangesPage(),
    NewExchangePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
    body: _widgetOptions.elementAt(_selectedIndex),
    bottomNavigationBar: BottomNavigationBar(
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
      currentIndex: _selectedIndex,
      selectedItemColor: colorScheme.primary,
      unselectedItemColor: colorScheme.onSurfaceVariant,
      backgroundColor: colorScheme.surfaceContainerHigh,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
    )
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

