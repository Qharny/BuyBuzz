// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:buybuzz/screens/Details/details_app_bar.dart';
import 'package:buybuzz/screens/Details/item_details.dart';
import 'package:buybuzz/screens/Details/slider_image.dart';
import 'package:flutter/material.dart';

import '../Home/Widget/product.dart';

class DetailScreen extends StatefulWidget {
  final Product product;
  const DetailScreen({
    super.key,
    required this.product,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int currentImage = 0;
  int currentSlide = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //for back button share and favourite
            const DetailsAppBar(),
            ImageSlider(
                onChange: (value) {
                  setState(() {
                    currentImage = value;
                  });
                },
                image: widget.product.imageUrl),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  5,
                  (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: currentSlide == index ? 15 : 8,
                        height: 8,
                        margin: const EdgeInsets.only(right: 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: currentSlide == index
                                ? Colors.black
                                : Colors.transparent,
                            border: Border.all(color: Colors.black)),
                      )),
            ),

            SizedBox(height: 20),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
              ),
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //product,price and selling
                  ItemDetails(product: widget.product)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
