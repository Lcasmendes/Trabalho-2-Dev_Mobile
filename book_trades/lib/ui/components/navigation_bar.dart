import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';

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
    final localizations = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;

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

