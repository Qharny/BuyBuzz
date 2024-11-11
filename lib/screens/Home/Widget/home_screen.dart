// ignore_for_file: prefer_const_constructors

import 'package:buybuzz/models/card_model.dart';
import 'package:flutter/material.dart';

import 'category.dart';
import 'home_app_bar.dart';
import 'image_slider.dart';
import 'product.dart';
import 'search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  int currentSlide = 0;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  bool _isMenuOpen = false;

  late AnimationController _menuController;
  late Animation<double> _menuAnimation;

  int _selectedIndex = 0; // Track the selected index for bottom navigation

  @override
  void initState() {
    super.initState();
    _menuController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _menuAnimation = Tween<double>(begin: 0, end: 1).animate(_menuController);
  }

  void _toggleMenu() {
    setState(() {
      _isMenuOpen = !_isMenuOpen;
      if (_isMenuOpen) {
        _menuController.forward();
      } else {
        _menuController.reverse();
      }
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  @override
  void dispose() {
    _menuController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 15),
              const CustomAppBar(),
              const SizedBox(height: 15),
              const TextRule(),
              const SizedBox(height: 10),
              ImageSlider(
                onChange: (value) {
                  setState(() {
                    currentSlide = value;
                  });
                },
                currentSlide: currentSlide,
              ),
              const SizedBox(height: 10),
              Categories(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Curated for you",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 2),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductCard(
                    imageUrl: product.imageUrl,
                    name: product.name,
                    price: product.price,
                    rating: product.rating,
                    reviews: product.review,
                    isNew: product.isNew,
                    discountPercentage: product.discountPercentage,
                    stockCount: product.stockCount,
                    colors: product.colors,
                    onAddToCart: product.onAddToCart,
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ScaleTransition(
            scale: _menuAnimation,
            child: FloatingActionButton(
              heroTag: "location",
              backgroundColor: Colors.blue,
              child: const Icon(Icons.my_location),
              onPressed: () {},
            ),
          ),
          const SizedBox(height: 16),
          ScaleTransition(
            scale: _menuAnimation,
            child: FloatingActionButton(
              heroTag: "settings",
              backgroundColor: Colors.green,
              child: const Icon(Icons.settings),
              onPressed: () {
                Navigator.of(context).pushNamed('/settings');
              },
            ),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            heroTag: "menu",
            backgroundColor: Colors.blue,
            onPressed: _toggleMenu,
            child: AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              progress: _menuController,
            ),
          ),
        ],
      ),
      
    );
  }
}