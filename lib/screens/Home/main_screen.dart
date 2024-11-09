// ignore_for_file: prefer_const_constructors

import 'package:buybuzz/screens/Cart/cart_screen.dart';
import 'package:buybuzz/screens/Details/details_screen.dart';

import 'package:buybuzz/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';

import '../../Favorite/favorite.dart';
import '../bottom_navbar.dart';
import 'Widget/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    HomeScreen(),
    Favorite(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavBar(
          onTabChange: (index) => navigateBottomBar(index),
        ),
        backgroundColor: Colors.white,
        body: _pages[_selectedIndex]);
  }
}
