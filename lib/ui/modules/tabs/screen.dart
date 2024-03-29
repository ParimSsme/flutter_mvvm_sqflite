import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_mvvm_design/core/resources/color_manager.dart';
import 'package:sqflite_mvvm_design/ui/modules/home/screen.dart';
import 'package:sqflite_mvvm_design/ui/modules/settings/screen.dart';

import '../../../config/router/routes.dart';
import '../../../providers/poet_model.dart';
import '../favorites/screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 0;

  final TextEditingController _searchController = TextEditingController();

  final tabs = [
    const HomeScreen(),
    const FavoritesScreen(),
    const SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    PoetModel poetModel = Provider.of<PoetModel>(context, listen: true);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: _selectedIndex == 0
              ? TextField(
                  controller: _searchController,
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: const InputDecoration(
                    hintText: ' ... جستجو',
                    hintStyle: TextStyle(color: Colors.white54),
                    border: InputBorder.none,
                  ),
                  onChanged: (value) => poetModel.searchPoets(value),
                )
              : const SizedBox(),
        ),
        body: tabs[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
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
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'تنظیمات',
            ),
          ],
        ),
        floatingActionButton: _selectedIndex == 0 ? FloatingActionButton(
          onPressed: () => AppNavigator.push(Routes.addPoet),
          backgroundColor: ColorManager.primary,
          child: const Icon(Icons.add),
        ) : const SizedBox());
  }
}
