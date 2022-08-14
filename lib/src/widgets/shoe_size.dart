import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/models/shoe_model.dart';
import 'package:shoes_app/src/screens/screens.dart';

class ShoePreview extends StatelessWidget {
  final bool fullScreen;

  const ShoePreview({
    Key? key, 
    required this.fullScreen
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if( !fullScreen ) {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const ShoeDescriptionScreen() ) );
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ( fullScreen) ? 5 : 30, 
          vertical: ( fullScreen) ? 0 : 5
        ),
        child: Container(
          width: double.infinity,
          height: (!fullScreen) ? 430 : 390,
          decoration: BoxDecoration(
            color: const Color(0xffFFCF53),
            borderRadius: ( !fullScreen) 
              ? BorderRadius.circular(50)
              : const BorderRadius.only( bottomLeft: Radius.circular( 50 ), bottomRight: Radius.circular( 50 ), topLeft: Radius.circular( 40), topRight: Radius.circular( 40) )
          ),
          child: Column(
            children: [
              const _ShoeWithShadow(),
              if( !fullScreen )
               const _ShoeTallas()
            ],
          ),
        ),
      ),
    );
  }
}

class _ShoeWithShadow extends StatelessWidget {
  const _ShoeWithShadow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context);
    
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Stack(
        children: [
          const Positioned(
            bottom: 20,
            right: 0,
            child: _ShoeShadow()
          ),
          Image(image: AssetImage( shoeModel.assetImage) )
        ],
      ),
    );
  }
}

class _ShoeShadow extends StatelessWidget {
  const _ShoeShadow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 230,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular( 100 ),
          boxShadow: const [
            BoxShadow( color: Color(0xffEAA14E), blurRadius: 40 )
          ]
        ),
      ),
    );
  }
}

class _ShoeTallas extends StatelessWidget {
  const _ShoeTallas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric( horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          _TallaShoeBox( number: 7 ),
          _TallaShoeBox( number: 7.5 ),
          _TallaShoeBox( number: 8 ),
          _TallaShoeBox( number: 8.5 ),
          _TallaShoeBox( number: 9 ),
          _TallaShoeBox( number: 9.5 )
        ],
      ),
    );
  }
}

class _TallaShoeBox extends StatelessWidget {
  final double number;
  
  const _TallaShoeBox({
    Key? key, 
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final shoeModel = Provider.of<ShoeModel>(context);

    return GestureDetector(
      onTap: () {
        final shoeModel = Provider.of<ShoeModel>(context, listen: false);
        shoeModel.talla = number;
      },
      child: Container(
        alignment: Alignment.center,
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: (number == shoeModel.talla ) ? const Color(0xffF1A23A) :Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            if( number == shoeModel.talla)
              const BoxShadow( color: Color(0xffF1A23A), blurRadius: 10, offset: Offset(0, 5) )
          ]
        ),
        child: Text('$number', style: TextStyle( 
            color: ( number == shoeModel.talla ) ?  Colors.white : const Color(0xffF1A23A),
            fontWeight: FontWeight.bold
          ) 
        ),
      ),
    );
  }
}