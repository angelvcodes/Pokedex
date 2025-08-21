import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class Pokedex extends StatelessWidget {
  const Pokedex({super.key});

  @override
  Widget build(BuildContext context) {
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
              child: GridView.builder(
                itemCount: 8,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 15,
                  mainAxisExtent: 190,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Cardpokemon(
                      image: 'lib/features/data/assets/pika.png',
                      name: 'Pikachu',
                      colorone: Colors.pink.shade200,
                      colortwo: Colors.pink.shade50,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Navbar(
        onHomeTap: () => '',
        onLeftTap: () => print('Notifications'),
        onRightTap: () => print('User'),
      ),
    );
  }
}