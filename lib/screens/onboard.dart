import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:rive/rive.dart';
import 'dart:ui' as ui;

class EnhancedOnboarding extends StatefulWidget {
  const EnhancedOnboarding({super.key});

  @override
  State<EnhancedOnboarding> createState() => _EnhancedOnboardingState();
}

class _EnhancedOnboardingState extends State<EnhancedOnboarding>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  late AnimationController _animationController;
  late Animation<double> _progressAnimation;
  int _currentPage = 0;
  bool _isLastPage = false;

  final List<OnboardingData> _pages = [
  OnboardingData(
    title: "Discover Amazing Products",
    subtitle: "Your Shopping Journey Begins Here",
    description:
        "Explore a curated collection of premium products from trusted vendors worldwide",
    animationPath: "https://public.rive.app/community/runtime-files/2244-4437-loading-animation.riv",
    gradientColors: [
      const Color(0xFF845EC2),
      const Color(0xFF2C73D2),
    ],
  ),
  OnboardingData(
    title: "Real-Time Delivery Tracking",
    subtitle: "Always Know Where Your Package Is",
    description:
        "Track your deliveries in real-time with precise location updates and estimated arrival times",
    animationPath: "https://public.rive.app/community/runtime-files/2197-5283-delivery-truck-animation.riv",
    gradientColors: [
      const Color(0xFF00C9A7),
      const Color(0xFF4D8076),
    ],
  ),
  OnboardingData(
    title: "Secure Payment Methods",
    subtitle: "Safe and Easy Transactions",
    description:
        "Multiple payment options with bank-grade security to keep your transactions protected",
    animationPath: "https://public.rive.app/community/runtime-files/2405-6282-payment-animation.riv",
    gradientColors: [
      const Color(0xFFFF8066),
      const Color(0xFFFF4B4B),
    ],
  ),
];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _progressAnimation =
        Tween<double>(begin: 0, end: 1).animate(_animationController);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
      _isLastPage = index == _pages.length - 1;
    });
    _animationController.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Animated Background
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            decoration: BoxDecoration(
              color: _pages[_currentPage].gradientColors[0],
              borderRadius: BorderRadius.circular(20),
              // gradient: LinearGradient(
              //   begin: Alignment.topLeft,
              //   end: Alignment.bottomRight,
              //   colors: _pages[_currentPage].gradientColors,
              // ),
            ),
            child: BackdropFilter(
              filter: ui.ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: Container(color: Colors.black.withOpacity(0.1)),
            ),
          ),

          // Floating Bubbles Animation
          ...List.generate(
            20,
            (index) => Positioned(
              left: MediaQuery.of(context).size.width * (index % 5) / 5,
              top: MediaQuery.of(context).size.height * (index % 4) / 4,
              child: AnimatedBubble(
                size: 100 + (index % 3) * 50,
                color: _pages[_currentPage].gradientColors[0].withOpacity(0.1),
              ),
            ),
          ),

          // Main Content
          SafeArea(
            child: Column(
              children: [
                // Top Bar
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AnimatedProgressBar(
                        progress: _progressAnimation,
                        totalPages: _pages.length,
                        currentPage: _currentPage,
                      ),
                      TextButton(
                        onPressed: () {
                          // Navigate to home
                        },
                        child: Text(
                          "Skip",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Page View
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: _onPageChanged,
                    itemCount: _pages.length,
                    itemBuilder: (context, index) {
                      return OnboardingPage(
                        data: _pages[index],
                        isCurrentPage: _currentPage == index,
                      );
                    },
                  ),
                ),

                // Bottom Navigation
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Page Indicator
                      SmoothPageIndicator(
                        controller: _pageController,
                        count: _pages.length,
                        effect: CustomizableEffect(
                          activeDotDecoration: DotDecoration(
                            width: 32,
                            height: 8,
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          dotDecoration: DotDecoration(
                            width: 8,
                            height: 8,
                            color: Colors.white.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),

                      // Next/Get Started Button
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        child: ElevatedButton(
                          onPressed: () {
                            if (!_isLastPage) {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                            } else {
                              // Navigate to home
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor:
                                _pages[_currentPage].gradientColors[0],
                            padding: EdgeInsets.symmetric(
                              horizontal: _isLastPage ? 40 : 32,
                              vertical: 16,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                _isLastPage ? "Get Started" : "Next",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              if (_isLastPage) ...[
                                const SizedBox(width: 8),
                                const Icon(Icons.arrow_forward),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final OnboardingData data;
  final bool isCurrentPage;

  const OnboardingPage({
    super.key,
    required this.data,
    required this.isCurrentPage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 3D Animation
          Expanded(
            flex: 3,
            child: RiveAnimation.asset(
              data.animationPath,
              fit: BoxFit.contain,
            )
                .animate(
                  target: isCurrentPage ? 1 : 0,
                )
                .scale(
                  begin: const Offset(0.8, 0.8),
                  end: const Offset(1, 1),
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                )
                .fadeIn(duration: const Duration(milliseconds: 500)),
          ),

          const SizedBox(height: 40),

          // Subtitle
          Text(
            data.subtitle,
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          )
              .animate(
                target: isCurrentPage ? 1 : 0,
              )
              .slideX(
                begin: 0.2,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOut,
              )
              .fadeIn(),

          const SizedBox(height: 8),

          // Title
          Text(
            data.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
          )
              .animate(
                target: isCurrentPage ? 1 : 0,
              )
              .slideX(
                begin: 0.2,
                duration: const Duration(milliseconds: 500),
                delay: const Duration(milliseconds: 100),
                curve: Curves.easeOut,
              )
              .fadeIn(),

          const SizedBox(height: 16),

          // Description
          Text(
            data.description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 16,
              height: 1.5,
            ),
          )
              .animate(
                target: isCurrentPage ? 1 : 0,
              )
              .slideX(
                begin: 0.2,
                duration: const Duration(milliseconds: 500),
                delay: const Duration(milliseconds: 200),
                curve: Curves.easeOut,
              )
              .fadeIn(),
        ],
      ),
    );
  }
}

class AnimatedProgressBar extends StatelessWidget {
  final Animation<double> progress;
  final int totalPages;
  final int currentPage;

  const AnimatedProgressBar({
    super.key,
    required this.progress,
    required this.totalPages,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(2),
        child: Stack(
          children: [
            Container(color: Colors.white.withOpacity(0.2)),
            AnimatedBuilder(
              animation: progress,
              builder: (context, child) {
                return FractionallySizedBox(
                  widthFactor: (currentPage + progress.value) / totalPages,
                  child: Container(color: Colors.white),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedBubble extends StatefulWidget {
  final double size;
  final Color color;

  const AnimatedBubble({
    super.key,
    required this.size,
    required this.color,
  });

  @override
  State<AnimatedBubble> createState() => _AnimatedBubbleState();
}

class _AnimatedBubbleState extends State<AnimatedBubble>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _positionAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
      // duration: Duration(seconds: 2 + (widget.size % 4)),
    )..repeat(reverse: true);

    _positionAnimation = Tween<double>(
      begin: -10,
      end: 10,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _positionAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _positionAnimation.value),
          child: Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.color,
            ),
          ),
        );
      },
    );
  }
}

class OnboardingData {
  final String title;
  final String subtitle;
  final String description;
  final String animationPath;
  final List<Color> gradientColors;

  OnboardingData({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.animationPath,
    required this.gradientColors,
  });
}
