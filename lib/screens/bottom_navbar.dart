import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  final void Function(int)? onTabChange;
  const BottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return GNav(
      onTabChange: (value) => onTabChange!(value),
      gap: 8,
      padding: const EdgeInsets.all(15),
      tabs: const [
        GButton(
          icon: Icons.grid_view_outlined,
          text: 'Home',
          // backgroundColor: Colors.grey,
          iconActiveColor: Colors.blue,
          curve: Cubic(1, 5, 12, 6),
        ),
        GButton(
          icon: Icons.favorite_border_outlined,
          text: 'favorite',
          // backgroundColor: Colors.grey,
          iconActiveColor: Colors.blue,
        ),
        GButton(
          icon: Icons.shopping_cart_outlined,
          text: 'Shop',
          // backgroundColor: Colors.grey,
          iconActiveColor: Colors.blue,
        ),
        GButton(
          icon: Icons.person,
          text: 'person',
          // backgroundColor: Colors.grey,
          iconActiveColor: Colors.blue,
        ),
      ],
    );
  }
}
