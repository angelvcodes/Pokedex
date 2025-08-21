import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/core/network/conectioapi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


final pokemonServiceProvider = Provider<PokemonService>((ref) {
  return PokemonService();
});
