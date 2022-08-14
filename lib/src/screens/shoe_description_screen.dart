import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/widgets/widgets.dart';

import '../helpers/helpers.dart';
import '../models/shoe_model.dart';

class ShoeDescriptionScreen extends StatelessWidget {
  const ShoeDescriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    changeStatusLight();

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [

              const Hero(
                tag: 'shoePreview',
                child: ShoePreview( fullScreen: true)
              ),

              Positioned(
                top: 30,
                child: FloatingActionButton(
                  
                  backgroundColor: Colors.transparent,
                  onPressed: () {
                    changeStatusDark();
                    Navigator.pop(context);
                  },
                  elevation: 0,
                  highlightElevation: 0,
                  child: const Icon( Icons.chevron_left, color: Colors.white, size: 60 ),
                ) 
              )
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  ShoeDescription(
                    title: 'Nike Air Max 720', 
                    description: 'The Nike Air Max 720 goes bigger than ever before with Nikes taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.'
                  ),
                  _ImportBuyNow(),
                  _ColorsWidget(),
                  _ButtonsLikeCartSettings()
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}

class _ButtonsLikeCartSettings extends StatelessWidget {
  const _ButtonsLikeCartSettings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric( vertical : 30),
      padding: const EdgeInsets.symmetric( horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const _ShadowedButton( icon: Icon( Icons.heart_broken, color: Colors.red, size: 25 ) ),
          _ShadowedButton( icon: Icon( Icons.add_shopping_cart, color: Colors.grey.withOpacity(0.4), size: 25 ) ),
          _ShadowedButton( icon: Icon( Icons.settings, color: Colors.grey.withOpacity(0.4), size: 25 ) )
        ],
      ),
    );
  }
}

class _ShadowedButton extends StatelessWidget {
  final Icon icon;
  
  const _ShadowedButton({
    Key? key, 
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow( color: Colors.black12, spreadRadius: -5, blurRadius: 20, offset: Offset(0, 10))
        ]
      ),
      child: icon,
    );
  }
}

class _ImportBuyNow extends StatelessWidget {
  const _ImportBuyNow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric( horizontal: 30),
      child: Container(
        margin: const EdgeInsets.only(top: 20, bottom: 20),
        child: Row(
          children: [
            const Text( '\$180.00', style: TextStyle( fontSize: 28, fontWeight: FontWeight.bold) ),
            const Spacer(),
            Bounce(
              duration: const Duration(seconds:  1),
              from: 8,
              child: const CustomButton(text: 'Buy Now', width: 120, height: 40 )
            ),
          ],
        ),
      ),
    );
  }
}

class _ColorsWidget extends StatelessWidget {
  const _ColorsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric( horizontal: 10 ),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: const [
                Positioned( left: 90, child: _ColorButton( color: Color(0xffC6D642), index:  1, image: 'assets/imgs/verde.png' )) ,
                Positioned( left: 60, child: _ColorButton( color: Color(0xffFFAD29), index:  2, image: 'assets/imgs/amarillo.png' ) ),
                Positioned( left: 30, child: _ColorButton( color: Color(0xff2099F1), index: 3, image: 'assets/imgs/azul.png' ) ),
                _ColorButton( color: Color(0xff364D56), index: 4, image: 'assets/imgs/negro.png' )
              ],
            )
          ),
          //const Spacer(),
          const CustomButton(text: "More related items", height: 30, width: 170, color: Color(0xffFFC675), )
        ],
      ),
    );
  }
}

class _ColorButton extends StatelessWidget {
  final Color color;
  final int index;
  final String image;
  
  const _ColorButton({
    Key? key, 
    required this.color, 
    required this.index, 
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration( milliseconds: index * 100),
      duration: const Duration( milliseconds: 300),
      child: GestureDetector(
        onTap: () {
          final shoeModel = Provider.of<ShoeModel>(context, listen: false);
          shoeModel.assetImage = image;
        },
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle
          ),
        ),
      ),
    );
  }
}