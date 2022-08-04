import 'package:flutter/material.dart';

class ShoePreview extends StatelessWidget {
  const ShoePreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: Container(
        width: double.infinity,
        height: 430,
        decoration: BoxDecoration(
          color: const Color(0xffFFCF53),
          borderRadius: BorderRadius.circular(50)
        ),
        child: Column(
          children: const [
            _ShoeWithShadow(),
            _ShoeTallas()
          ],
        ),
      ),
    );
  }
}

class _ShoeWithShadow extends StatelessWidget {
  const _ShoeWithShadow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Stack(
        children: const [
          Positioned(
            bottom: 20,
            right: 0,
            child: _ShoeShadow()
          ),
          Image(image: AssetImage('assets/imgs/azul.png') )
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
    return Container(
      alignment: Alignment.center,
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          //BoxShadow()
        ]
      ),
      child: Text('$number', style: const TextStyle( 
          color: Color(0xffF1A23A),
          fontWeight: FontWeight.bold
        ) 
      ),
    );
  }
}