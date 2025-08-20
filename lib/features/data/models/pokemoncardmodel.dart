
import 'package:flutter/material.dart';


class PokemonCard {
  final String name;
  final String imageUrl;
  final Color colorOne;
  final Color colorTwo;
   final Widget? page;
  PokemonCard({
    required this.name,
    required this.imageUrl,
    required this.colorOne,
    required this.colorTwo, 
    this.page,

  });
}