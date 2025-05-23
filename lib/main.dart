import 'package:buybuzz/screens/Home/Widget/home_screen.dart';
import 'package:buybuzz/screens/auth/otp_screen.dart';
import 'package:buybuzz/screens/onboard.dart';
import 'package:buybuzz/screens/profile/edit_profile.dart';
import 'package:buybuzz/screens/roleselect.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BuyBuzz());
}

class BuyBuzz extends StatelessWidget {
  const BuyBuzz({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BuyBuzz',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const EnhancedOnboarding(),
      routes: {
        // '/login': (context) => const LoginScreen(),
        // '/register': (context) => const RegisterScreen(),
        '/otp': (context) => const OtpVerificationScreen(),
        '/role': (context) => const RoleSelectionScreen(),
        '/home': (context) => const HomeScreen(),
        '/edit': (context) => EditProfilePage(),
      },
    );
  }
}
