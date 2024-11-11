import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _menuController;
  bool _isMenuOpen = false;

  @override
  void initState() {
    super.initState();
    _menuController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _menuController.dispose();
    super.dispose();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Stack(
        alignment: Alignment.bottomRight,
        children: [
          if (_isMenuOpen) ...[
            Positioned(
              bottom: 80,
              right: 0,
              child: FloatingActionButton(
                onPressed: () {
                  // Action for button 1
                },
                backgroundColor: Colors.blue,
                child: const Icon(Icons.add),
              ),
            ),
            Positioned(
              bottom: 80,
              right: 60,
              child: FloatingActionButton(
                onPressed: () {
                  // Action for button 2
                },
                backgroundColor: Colors.green,
                child: const Icon(Icons.favorite),
              ),
            ),
            Positioned(
              bottom: 80,
              right: 120,
              child: FloatingActionButton(
                onPressed: () {
                  // Action for button 3
                },
                backgroundColor: Colors.orange,
                child: const Icon(Icons.share),
              ),
            ),
          ],
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            transform: _isMenuOpen
                ? Matrix4.rotationZ(0.785398)
                : Matrix4.rotationZ(0),
            child: FloatingActionButton(
              onPressed: _toggleMenu,
              backgroundColor: Colors.red,
              child: AnimatedIcon(
                icon: AnimatedIcons.menu_close,
                progress: _menuController,
              ),
            ),
          ),
        ],
      ),
    );
  }
} 