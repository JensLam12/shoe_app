import 'package:flutter/material.dart';
import 'package:shoes_app/src/screens/shoe_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shoes App',
      home: Scaffold(body: ShoeScreen()),
    );
  }
}
