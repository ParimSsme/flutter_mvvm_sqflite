import 'package:flutter/material.dart';
import 'package:sqflite_mvvm_design/core/resources/color_manager.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Demo'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.shifting,
        selectedFontSize: 20,
        selectedIconTheme: const IconThemeData(color: ColorManager.primary, size: 35),
        unselectedIconTheme: const IconThemeData(size: 35),
        selectedItemColor: ColorManager.primary,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'خانه',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'علاقمندی ها',
          ),
        ],
      ),
    );;
  }
}
