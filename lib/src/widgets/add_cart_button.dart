import 'package:flutter/material.dart';
import 'package:shoes_app/src/widgets/widgets.dart';

class AddCartButton extends StatelessWidget {

  final double import; 

  const AddCartButton({
    Key? key, 
    required this.import
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all( 10),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity( 0.10 ),
          borderRadius: BorderRadius.circular( 100 )
        ),
        child: Row(
          children: [
            const SizedBox( width: 20 ),
            Text( '\$$import', style: const TextStyle( fontSize: 28, fontWeight:  FontWeight.bold) ),
            const Spacer(),
            const CustomButton( text: 'Add to cart' ),
            const SizedBox( width: 20 ),
          ],
        ),
      )
    );
  }
}