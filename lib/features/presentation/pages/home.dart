import 'package:flutter/material.dart';
import 'package:pokedex/features/data/models/pokemoncardmodel.dart';
import 'package:pokedex/features/presentation/providers/pokemoncardprovider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/widgets.dart';


class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final home = ref.watch(pokemonCardsProvider);

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppbarPokemon(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                Text('Hi! Stanly 👋', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text('Welcome Back', style: TextStyle(fontSize: 14)),
                const SizedBox(height: 10),
                _gridView(home),               
                Text('Live Battle', style: TextStyle(fontSize: 14)),
                const SizedBox(height: 10),
                BatleCard()
                

          ],
        ),
      ),
      bottomNavigationBar:Navbar(
        onHomeTap: () => print('Home'), 
        onLeftTap: () => print('Notifications'), 
        onRightTap: () => print('User'),
        ),
    );
  }

  Expanded _gridView(List<PokemonCard> home) {
    return Expanded(
            child: GridView.builder(
              itemCount: home.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                childAspectRatio: 1.6,
              ),
              itemBuilder: (context, index) {
                final pokemon = home[index];
                return CardHome(
                  name: pokemon.name,
                  colorone: pokemon.colorOne,
                  colortwo: pokemon.colorTwo,
                  image: pokemon.imageUrl,
                );
              },
            ),
          );
  }
}






