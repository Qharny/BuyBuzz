import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const MyButton({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.indigo, borderRadius: BorderRadius.circular(50)),
        margin: const EdgeInsets.symmetric(horizontal: 50),
        padding: const EdgeInsets.all(25),
        child: Center(child: Text(text)),
      ),
    );
  }
}
