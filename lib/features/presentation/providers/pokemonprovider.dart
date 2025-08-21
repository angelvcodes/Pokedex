import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/features/data/models/pokemonmodel.dart';
import 'package:pokedex/features/presentation/providers/pokemonserviceprovider.dart';


final pokemonsProvider = FutureProvider<List<PokemonModel>>((ref) async {
  final service = ref.watch(pokemonServiceProvider);
  return service.getPokemons(limit: 20, offset: 0);
});

final pokemonDetailProvider = FutureProvider.family<PokemonModel, String>((ref, nameOrId) async {
  final service = ref.watch(pokemonServiceProvider);
  return service.getPokemon(nameOrId);
});
