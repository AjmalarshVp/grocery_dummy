import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/bloc/dark_theme/dark_theme_bloc.dart';
import 'package:grocery_app/screens/category/categories.dart';
import 'package:grocery_app/screens/home_screen/home_screen.dart';
import 'package:grocery_app/screens/user.dart';
import 'package:badges/badges.dart' as badge;

import '../widgets/text_widget.dart';
import 'cart/cart_screen.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  bool isDark = false;
  int _selectedIndex = 0;
  final List<Map<String, dynamic>> _pages = [
    {'page': const HomeScreen(), 'title': 'Home Screen'},
    {'page': CategoriesScreen(), 'title': 'Categories Screen'},
    {'page': const CartScreen(), 'title': 'Cart Screen'},
    {'page': const UserScreen(), 'title': 'user Screen'},
  ];

  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DarkThemeBloc, DarkThemeState>(
      builder: (context, state) {
        if (state is AppThemeState) {
          isDark = state.isDark;
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(_pages[_selectedIndex]['title']),
          ),
          body: _pages[_selectedIndex]['page'],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor:
                isDark ? Theme.of(context).cardColor : Colors.white,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: _selectedIndex,
            unselectedItemColor: isDark ? Colors.white10 : Colors.black12,
            selectedItemColor:
                isDark ? Colors.lightBlue.shade200 : Colors.black87,
            onTap: _selectedPage,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                    _selectedIndex == 0 ? IconlyBold.home : IconlyLight.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(_selectedIndex == 1
                    ? IconlyBold.category
                    : IconlyLight.category),
                label: "Categories",
              ),
              BottomNavigationBarItem(
                icon: badge.Badge(
                  badgeAnimation: const badge.BadgeAnimation.slide(),
                  badgeStyle: badge.BadgeStyle(
                    shape: badge.BadgeShape.circle,
                    badgeColor: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  position: badge.BadgePosition.topEnd(top: -7, end: -7),
                  badgeContent: FittedBox(
                      child: TextWidget(
                          text: "1", color: Colors.white, textSize: 15)),
                  child: Icon(
                      _selectedIndex == 2 ? IconlyBold.buy : IconlyLight.buy),
                ),
                label: "Cart",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                    _selectedIndex == 3 ? IconlyBold.user2 : IconlyLight.user2),
                label: "User",
              ),
            ],
          ),
        );
      },
    );
  }
}
