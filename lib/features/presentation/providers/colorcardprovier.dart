import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Mapa de colores por tipo
final pokemonTypeColorsProvider = Provider<Map<String, Color>>((ref) {
  return {
    'normal': Colors.brown,
    'fire': Colors.red,
    'water': Colors.blue,
    'grass': Colors.green,
    'electric': Colors.yellow,
    'ice': Colors.cyan,
    'fighting': Colors.orange,
    'poison': Colors.purple,
    'ground': Colors.brown,
    'flying': Colors.indigo,
    'psychic': Colors.pink,
    'bug': Colors.lightGreen,
    'rock': Colors.grey,
    'ghost': Colors.deepPurple,
    'dark': Colors.black87,
    'dragon': Colors.indigoAccent,
    'steel': Colors.blueGrey,
    'fairy': Colors.pinkAccent,
  };
});


final pokemonCardColorsProvider =
    Provider.family<List<Color>, List<String>>((ref, types) {
  final typeColors = ref.watch(pokemonTypeColorsProvider);

  if (types.length >= 2) {
  
    return [
      typeColors[types[0]] ?? Colors.grey,
      typeColors[types[1]] ?? Colors.grey.shade300,
    ];
  } else {
    
    final color = typeColors[types.first] ?? Colors.grey;
    return [
      color,
      color.withValues(alpha: 0.5), 
    ];
  }
});
