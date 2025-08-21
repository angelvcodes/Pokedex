import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/features/presentation/pages/home.dart';
import 'package:pokedex/features/presentation/providers/colorcardprovier.dart';
import 'package:pokedex/features/presentation/providers/pokemonprovider.dart';

import '../widgets/widgets.dart';

class Pokedex extends ConsumerWidget {
  const Pokedex({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonprovider = ref.watch(pokemonsProvider);

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppbarPokemon(),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'What Are You',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text(
              'Looking For?',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SearchBarCustom(),

            Expanded(
              child: pokemonprovider.when(
                data: (pokemonprovider) => GridView.builder(
                  itemCount: pokemonprovider.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 15,
                    mainAxisExtent: 190,
                  ),
                  itemBuilder: (context, index) {
                    final pokemon = pokemonprovider[index];
                    final colors = ref.watch(pokemonCardColorsProvider(pokemon.types));
                    return Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Cardpokemon(
                        image: pokemon.imageUrl,
                        name: pokemon.name,
                        types: pokemon.types,
                        colorone: colors[0],
                        colortwo: colors[1],
                      ),
                    );
                  },
                ),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, _) => Center(child: Text("Error: $e")),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Navbar(
        onHomeTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
        ),
        onLeftTap: () => print('Notifications'),
        onRightTap: () => print('User'),
      ),
    );
  }
}
