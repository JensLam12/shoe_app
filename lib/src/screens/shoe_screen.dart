import 'package:flutter/material.dart';
import 'package:shoes_app/src/widgets/widgets.dart';

import '../helpers/helpers.dart';

class ShoeScreen extends StatelessWidget {
  const ShoeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    changeStatusDark();

    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(text: 'For you'),
          const SizedBox( height: 20 ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: const [
                  Hero(
                    tag: 'shoePreview',
                    child: ShoePreview( fullScreen: false ),
                  ),
                  ShoeDescription(
                    title: 'Nike Air Max 720', 
                    description: 'The Nike Air Max 720 goes bigger than ever before with Nikes taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.'
                  )
                ],
              ),
            ),
          ),
          const AddCartButton(import: 180.0)
        ]
      ),
    );
  }
}
