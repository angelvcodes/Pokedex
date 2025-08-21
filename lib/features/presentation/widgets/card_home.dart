import 'package:flutter/material.dart';

class CardHome extends StatelessWidget {
  final String name;
  final Color colorone;
  final Color colortwo;
  final String image;
  final Widget? page;

  const CardHome({
    super.key,
    required this.name,
    required this.colorone,
    required this.colortwo,
    required this.image,
    this.page,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (page != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page!),
          );
        }
      },
      child: Stack(
        clipBehavior: Clip.none, 
        children: [
          
          Container(
            width: 160,
            height: 100,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [colorone, colortwo],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: colorone.withOpacity(0.4),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            padding: const EdgeInsets.all(12),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          
          Positioned(
            top: -15,
            right: -5,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: colorone.withOpacity(0.2),
                    blurRadius: 25,
                    spreadRadius: 5,
                  ),
                ],
              ),
            ),
          ),

        
          Positioned(
            top: -15,
            right: -10,
            child: Image.asset(
              image,
              height: 75,
            ),
          ),
        ],
      ),
    );
  }
}
