import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          style: IconButton.styleFrom(
              backgroundColor: Colors.white, padding: const EdgeInsets.all(20)),
          onPressed: () {},
          icon: Image.asset(
            'images/mobilshopbag.jpeg',
            height: 30,
          ),
        ),
        IconButton(
            style: IconButton.styleFrom(
                backgroundColor: Colors.white, padding: const EdgeInsets.all(20)),
            onPressed: () {},
            iconSize: 30,
            icon: const Icon(Icons.notifications_outlined)),
      ],
    );
  }
}
