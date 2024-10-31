import 'package:buybuzz/screens/Cart/cart_screen.dart';
import 'package:buybuzz/screens/Home/home_screen.dart';
import 'package:buybuzz/screens/favorite.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 2;

  List screens = const [
    Scaffold(),
    Favourite(),
    HomeScreen(),
    CartScreen(),
    Scaffold(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            currentIndex = 2;
          });
        },
        shape: const CircleBorder(),
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.menu,
          color: Colors.white,
          size: 35,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        height: 60,
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 2;
                });
              },
              icon: Icon(
                Icons.grid_view_outlined,
                color: currentIndex == 0 ? Colors.yellow : Colors.grey,
                size: 25,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 1;
                });
              },
              icon: Icon(
                Icons.favorite_border,
                color: currentIndex == 1 ? Colors.yellow : Colors.grey,
                size: 25,
              ),
            ),
            const SizedBox(width: 16),
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 3;
                });
              },
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: currentIndex == 3 ? Colors.yellow : Colors.grey,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 4;
                });
              },
              icon: Icon(
                Icons.person,
                color: currentIndex == 4 ? Colors.yellow : Colors.grey,
                size: 30,
              ),
            ),
          ],
        ),
      ),
      body: screens[currentIndex],
    );
  }
}
