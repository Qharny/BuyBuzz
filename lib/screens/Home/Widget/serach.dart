import 'package:buybuzz/constant.dart';
import 'package:flutter/material.dart';

class TextRule extends StatelessWidget {
  const TextRule({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: kcontentor),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: Row(
        children: [
          const Icon(
            Icons.search,
            color: Colors.black,
            size: 30,
          ),
          const SizedBox(width: 10),
          const Flexible(
              flex: 4,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search ............",
                  border: InputBorder.none,
                ),
              )),
          Container(
            height: 25,
            width: 1.5,
            color: Colors.black,
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.tune,
                color: Colors.black,
              ))
        ],
      ),
    );
  }
}
