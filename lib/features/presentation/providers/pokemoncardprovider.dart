import 'package:flutter/material.dart';
import 'package:pokedex/features/data/models/pokemoncardmodel.dart';
import 'package:pokedex/features/presentation/pages/pokedex.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemoncardprovider.g.dart';

@riverpod
class PokemonCards extends _$PokemonCards {
  @override
  List<PokemonCard> build() => 
  [
 PokemonCard(
      name: "Pokedex",
      imageUrl: "lib/features/data/assets/pokeball.png",
      colorOne: Colors.red,
      colorTwo: Colors.redAccent,
      page: const Pokedex(),
    ),
    PokemonCard(
      name: "Moves",
      imageUrl: "lib/features/data/assets/fuego.png",
      colorOne: Colors.yellow.shade900,
      colorTwo: Colors.yellow.shade600,
    ),
    PokemonCard(
      
      name: "Evolutions",
      imageUrl: "lib/features/data/assets/adn.png",
      colorOne: Colors.lightBlue,
      colorTwo: Colors.lightBlue.shade800,
    ),
    PokemonCard(
      name: "Locations",
      imageUrl: "lib/features/data/assets/ubi.png",
      colorOne: Colors.green.shade900,
      colorTwo: Colors.green.shade600,
    ),

  ];
}
