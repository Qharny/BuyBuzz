import 'package:buybuzz/screens/onboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BuyBuzz());
}

class BuyBuzz extends StatelessWidget {
  const BuyBuzz({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BuyBuzz',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const EnhancedOnboarding(),
    );
  }
}