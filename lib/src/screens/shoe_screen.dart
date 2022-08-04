import 'package:flutter/material.dart';
import 'package:shoes_app/src/widgets/widgets.dart';

class ShoeScreen extends StatelessWidget {
  const ShoeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          CustomAppBar(text: 'For you'),
          SizedBox( height: 20 ),
          ShoePreview()
        ]
      ),
    );
  }
}
