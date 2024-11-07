// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:buybuzz/screens/Details/details_app_bar.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            //for back button share and favourite
            const DetailsAppBar(),
          ],
        ),
      ),
    );
  }
}
