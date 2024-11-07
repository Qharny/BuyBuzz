// ignore_for_file: prefer_const_constructors

import 'package:buybuzz/constant.dart';
import 'package:flutter/material.dart';

class DetailsAppBar extends StatelessWidget {
  const DetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          IconButton(
              style: IconButton.styleFrom(
                backgroundColor: kcontentor,
                padding: EdgeInsets.all(15),
              ),
              onPressed: () {},
              iconSize: 30,
              icon: const Icon(Icons.arrow_back_ios)),
          const Spacer(),
          IconButton(
              style: IconButton.styleFrom(
                backgroundColor: kcontentor,
                padding: EdgeInsets.all(15),
              ),
              onPressed: () {},
              iconSize: 30,
              icon: const Icon(Icons.share_outlined)),
          SizedBox(width: 10),
          IconButton(
              style: IconButton.styleFrom(
                backgroundColor: kcontentor,
                padding: EdgeInsets.all(15),
              ),
              onPressed: () {},
              iconSize: 30,
              icon: const Icon(Icons.favorite)),
        ],
      ),
    );
  }
}
