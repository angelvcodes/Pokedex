import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/features/presentation/providers/livebatleprovider.dart';
import 'package:pokedex/features/presentation/providers/pokemoncardprovider.dart';
import '../widgets/widgets.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final home = ref.watch(pokemonCardsProvider);
    final livebatle = ref.watch(livebatleProvider);

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppbarPokemon(),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Text(
                  'Hi! Stanly 👋',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text('Welcome Back', style: TextStyle(fontSize: 14)),
                const SizedBox(height: 10),
              ]),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                final pokemon = home[index];
                return CardHome(
                  name: pokemon.name,
                  colorone: pokemon.colorOne,
                  colortwo: pokemon.colorTwo,
                  image: pokemon.imageUrl,
                  page: pokemon.page,
                );
              }, childCount: home.length),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 1.6,
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text('Live Battle', style: TextStyle(fontSize: 14)),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 130,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: livebatle.length,
                      itemBuilder: (context, index) {
                        final data = livebatle[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child:  BatleCard(
                            text: data.text,
                            colorOne: data.colorOne,
                            colorTwo: data.colorTwo,
                            imageOne: data.imageUrl1,
                            imageTwo: data.imageUrl2,
                            avatar1: data.avatarimage1,
                            avatar2: data.avatarimage2,
                            avatar3: data.avatarimage3,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: Navbar(
        onHomeTap: () =>'',
        onLeftTap: () => print('Notifications'),
        onRightTap: () => print('User'),
      ),
    );
  }
}