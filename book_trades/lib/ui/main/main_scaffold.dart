import 'package:flutter/material.dart';
import 'package:projeto2/ui/main/main_page.dart';
import 'package:projeto2/ui/my_exchanges/my_exchanges_page.dart';
import 'package:projeto2/ui/new_exchanges/new_exchange_page.dart';
import 'package:projeto2/ui/components/navigation_bar.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    MainPage(),
    MyExchangesPage(),
    NewExchangePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
