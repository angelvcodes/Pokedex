import 'package:flutter/material.dart';

class CardHome extends StatelessWidget {
  final String name;
  final String image;
  final Color colorone;
  final Color colortwo;
  const CardHome({
    super.key,
    required this.name,
    required this.image,
    required this.colorone,
    required this.colortwo,
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;


    return InkWell(
      onTap: () {
        
        
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: size.height * 0.14,
            width: size.width * 0.44,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [colorone, colortwo],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          Positioned(top: size.height*-0.01, right: 0, child: Image.asset(image, height: 60)),
          Positioned(
            top: 35,
            left: 20,
            child: Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
