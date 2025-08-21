import 'package:flutter/material.dart';

class Cardpokemon extends StatelessWidget {
  final String image;
  final String name;
  final Color colorone;
  final Color colortwo;

  const Cardpokemon({
    super.key,
    required this.image,
    required this.name,
    required this.colorone,
    required this.colortwo,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 150,
          height: 180,
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [colorone, colortwo],
              radius: 1.5,
              center: Alignment.center,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
        ),
        Positioned(
          top: -10,
          left: 0,
          right: 0,
          child: Center(child: Image.asset(image, height: 140)),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                Icon(Icons.play_circle_fill_sharp),
              ],
            ),
          ),
        ),
      ],
    );
  }
}