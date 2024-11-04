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
<<<<<<< HEAD
              backgroundColor: Colors.white, padding: const EdgeInsets.all(20)),
=======
            // backgroundColor: Colors.white,
            padding: EdgeInsets.all(10),
          ),
>>>>>>> 3ad5dbe03d7b8299433efda193a59996e2605927
          onPressed: () {},
          icon: Image.asset(
            'images/mobilshopbag.jpeg',
            height: 30,
          ),
        ),
        IconButton(
            style: IconButton.styleFrom(
<<<<<<< HEAD
                backgroundColor: Colors.white, padding: const EdgeInsets.all(20)),
=======
              // backgroundColor: Colors.white,
              padding: EdgeInsets.all(20),
            ),
>>>>>>> 3ad5dbe03d7b8299433efda193a59996e2605927
            onPressed: () {},
            iconSize: 30,
            icon: const Icon(Icons.notifications_outlined)),
      ],
    );
  }
}
