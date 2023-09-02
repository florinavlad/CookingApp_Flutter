import 'package:flutter/material.dart';

import '../screens/chef_recipes.dart';
import '../screens/home_screen.dart';

class NavItem {
  final int? id;
  final String? icon;
  final Widget? destination;

  NavItem({this.id, this.icon, this.destination});

  bool destinationChecker() {
    if (destination != null) {
      return true;
    }
    return false;
  }
}

class NavigationProvider with ChangeNotifier {
  int _selectedIndex = 0;
  List<NavItem> _navItems = [
    NavItem(
      id: 1,
      icon: "icons/home.svg",
      destination: HomeScreen(),
    ),
    NavItem(
      id: 2,
      icon: "icons/chef.svg",
      destination: ChefRecipes(
        chefName: '',
        recipes: [],
      ),
    ),
  ];

  int get selectedIndex => _selectedIndex;
  List<NavItem> get navItems => _navItems;

  void setIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
