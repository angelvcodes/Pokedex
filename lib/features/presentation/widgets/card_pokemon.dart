import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Cardpokemon extends ConsumerWidget {
  final String image;
  final String name;
  final List<String> types;
  final Color colorone;
  final Color colortwo;

  const Cardpokemon({
    super.key,
    required this.image,
    required this.name,
    required this.types,
    required this.colorone,
    required this.colortwo,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
        ),
        Positioned(
          top: -20,
          left: 0,
          right: 0,
          child: Center(child: Image.network(image, height: 150)),
        ),
        Positioned(
                  right: 20,
                  bottom: 10,
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.end,
                    direction: Axis.vertical,
                    spacing: 4,
                    children: types.map((type) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(type, style: const TextStyle(fontSize: 10)),
                      );
                    }).toList(),
                  ),
                ),
        Positioned(
          bottom: 10,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
             
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                  ),
                ),

                
              ],
            ),
          ),
        ),
      ],
    );
  }
}
