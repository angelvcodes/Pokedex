import 'package:flutter/material.dart';

class BatleCard extends StatelessWidget {
  const BatleCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height:130,
      width: 200,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.yellow,
            Colors.yellow,
            Colors.blue,
            Colors.blue
           ],
           stops: [0.0, 0.5,0.5, 1.0],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: 
      Column(
        children: [
          Row(
              children: [
                Container(
                  child: Image.network(''),
                ),
                Container(
                  child: Image.network(''),
                )
              ],
          )
        ],
      )
    );
  }
}