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

class _HomeScreenState extends State<HomeScreen> {
  int currentSlide = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
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
                  currentSlide: currentSlide),
              // const SizedBox(height: 10),
              const SizedBox(height: 10),
              //for categories
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
                        color: Colors.black54),
                  )
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
                  })
            ],
          ),
        ),
      ),
    );
  }
}
