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









        bottomNavigationBar: Navbar(
        onHomeTap: () =>'',
        onLeftTap: () => print('Notifications'),
        onRightTap: () => print('User'),
      ), 
    );

  }
}
