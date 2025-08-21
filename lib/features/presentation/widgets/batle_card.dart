import 'package:flutter/material.dart';

class BatleCard extends StatelessWidget {
  final Color colorOne;
  final Color colorTwo;
  final String imageOne;
  final String imageTwo;
  final String text;
  final String avatar1;
  final String avatar2;
  final String avatar3;
  

  const BatleCard({
    super.key,
    required this.colorOne,
    required this.colorTwo,
    required this.imageOne,
    required this.imageTwo,
    required this.text,
    required this.avatar1,
    required this.avatar2,
    required this.avatar3,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 200,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [colorOne, colorOne, colorTwo, colorTwo],
          stops: [0.0, 0.48, 0.5, 1.0],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(imageOne, height: 90),
                Image.asset(imageTwo, height: 90),
              ],
            ),
          ),
          Container(
            height: 40,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 36, 36, 36).withOpacity(0.95),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Stack(
                children: [
                   CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage(avatar1),
                  ),
                  Positioned(
                    left: 15,
                    child:  CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.blue,
                      backgroundImage: AssetImage(avatar2),
                    ),
                  ),
                  Positioned(
                    left: 30,
                    child:  CircleAvatar(
                      radius: 10,
                      backgroundImage: AssetImage(avatar3),
                      backgroundColor: Colors.red,
                      
                    ),
                  ),
                  Positioned(
                    left: 55,
                    top: 5,
                    child: Text(text, style: TextStyle(fontSize: 9)),
                  ),
                  Positioned(
                    left: 150,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}