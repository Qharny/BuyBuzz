import 'package:flutter/material.dart';

class RoleSelectionScreen extends StatefulWidget {
  final Function(String)? onRoleSelected;

  const RoleSelectionScreen({
    super.key,
    this.onRoleSelected,
  });

  @override
  State<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> with TickerProviderStateMixin {
  late AnimationController _backgroundController;
  late AnimationController _cardsController;
  late Animation<double> _backgroundAnimation;
  late List<Animation<Offset>> _cardSlideAnimations;

  @override
  void initState() {
    super.initState();
    
    // Background animation setup
    _backgroundController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();

    _backgroundAnimation = CurvedAnimation(
      parent: _backgroundController,
      curve: Curves.easeInOut,
    );

    // Cards animation setup
    _cardsController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..forward();

    _cardSlideAnimations = List.generate(
      3,
      (index) => Tween<Offset>(
        begin: const Offset(-1.5, 0),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: _cardsController,
          curve: Interval(
            index * 0.2,
            0.6 + (index * 0.2),
            curve: Curves.easeOutBack,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _backgroundController.dispose();
    _cardsController.dispose();
    super.dispose();
  }

  Widget _buildRoleCard({
    required String title,
    required String emoji,
    required Color color,
    required String description,
    required Animation<Offset> slideAnimation,
  }) {
    return SlideTransition(
      position: slideAnimation,
      child: GestureDetector(
        onTap: () => widget.onRoleSelected?.call(title.toLowerCase()),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.3),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Positioned(
                  right: -20,
                  top: -20,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Text(
                            emoji,
                            style: const TextStyle(fontSize: 40),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  title,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  description,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Text(
                          'Select Role',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackground(double screenWidth) {
    return Positioned(
      top: -160,
      left: -30,
      child: Transform.rotate(
        angle: -35 * _backgroundAnimation.value,
        child: Container(
          width: 1.2 * screenWidth,
          height: 1.2 * screenWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(150),
            gradient: const LinearGradient(
              begin: Alignment(-0.2, -0.8),
              end: Alignment.bottomCenter,
              colors: [
                Color(0x007CBFCF),
                Color.fromARGB(255, 49, 150, 233),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            AnimatedBuilder(
              animation: _backgroundAnimation,
              builder: (context, child) => _buildBackground(screenSize.width),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  const Text(
                    '👋 Welcome!',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Choose your role to get started',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 40),
                  _buildRoleCard(
                    title: 'Vendor',
                    emoji: '🏪',
                    color: Colors.blue,
                    description: 'Start selling your products and grow your business',
                    slideAnimation: _cardSlideAnimations[0],
                  ),
                  _buildRoleCard(
                    title: 'User',
                    emoji: '🛍️',
                    color: Colors.green,
                    description: 'Discover and shop amazing products',
                    slideAnimation: _cardSlideAnimations[1],
                  ),
                  _buildRoleCard(
                    title: 'Delivery',
                    emoji: '🚚',
                    color: Colors.orange,
                    description: 'Deliver products and earn money',
                    slideAnimation: _cardSlideAnimations[2],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}