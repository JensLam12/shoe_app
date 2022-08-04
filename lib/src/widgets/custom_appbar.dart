import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String text;

  const CustomAppBar({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          width: double.infinity,
          child: Row(
            children: [
              Text(text, style: const TextStyle( fontSize: 30, fontWeight: FontWeight.bold)),
              const Spacer(),
              const Icon(Icons.search, size: 30)
            ],
          ),
        ),
      ),
    );
  }
}
